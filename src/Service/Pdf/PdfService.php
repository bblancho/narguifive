<?php

namespace App\Service\Pdf;

use Dompdf\Dompdf;
use Dompdf\Options;


class PdfService
{
    private $dompdf ;
    
    public function __construct( Dompdf $dompdf )
    {
        $this->dompdf = new Dompdf() ;

        $pdfOptions = new Options() ;

        $pdfOptions->setPaper('A4', 'landscape') ;
        $pdfOptions->set('defaultFont', 'Courier') ;

        $this->dompdf->setOptions($pdfOptions);
    }

    public function sendEmail( $email, $sujet, $message ): void
    {
       
    }

}