<?php

namespace App\Service\Upload;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;

class UploadService
{
    private $slugger;

    public function __construct(SluggerInterface $slugger)
    {
        $this->slugger = $slugger;
    }

    public function uploadFile(UploadedFile $file, string $directory)
    {
        $originalFilename = pathinfo( $file->getClientOriginalName(), PATHINFO_FILENAME ) ;
        $safeFilename = $this->slugger->slug($originalFilename) ;
        $fileName = $safeFilename.'-'.uniqid().'.'.$file->guessExtension() ;

        try {
            $file->move( $directory, $fileName);

        } catch (FileException $e) {
            // ... handle exception if something happens during file upload
        }

        return $fileName;
    }


}