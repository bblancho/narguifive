<?php

namespace App\Service\Mail;

use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class MailService
{
    private $mailer ;
    
    public function __construct( MailerInterface $mailer )
    {
        $this->mailer = $mailer;
    }

    public function sendEmail( $email, $sujet, $message ): void
    {
        $email = ( new Email() )
            ->from('blanchard.banyingela@laposte.net')
            ->to( $email )
            //->cc('cc@example.com')
            //->bcc('bcc@example.com')
            ->replyTo('blanchard.banyingela@laposte.net')
            //->priority(Email::PRIORITY_HIGH)
            ->subject($sujet)
            ->text($message) ;

        $this->mailer->send($email) ;
    }

}