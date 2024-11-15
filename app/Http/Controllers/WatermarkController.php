<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WatermarkController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $request->validate([
            'fileimage' => 'required|file|mimes:png,jpg|max:5048',
            'message' => 'required|string|max:20|min:10',
        ]);

        $file = $request->file('fileimage');
        $text = $request->input('message');

        return response()->stream(function () use ($text, $file) {
            $image = imagecreatefromjpeg($file);
            $imageColor = imagecolorallocate($image, 255, 255, 255);
            $fontSize = 5;
            $margin = 10;
            $textWidth = imagefontwidth($fontSize) * strlen($text);
            $textHeight = imagefontheight($fontSize);
            $x = imagesx($image) - $textWidth - $margin;
            $y = imagesy($image) - $textHeight - $margin;
            imagestring($image, $fontSize, $x, $y, $text, $imageColor);
            header('Content-type: image/jpeg');
            imagejpeg($image);
            imagedestroy($image);
        }, 200,['Content-Type'=>'image/jpeg']);
    }
}
