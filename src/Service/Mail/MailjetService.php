<?php

namespace App\Service\Mail;

use Mailjet\Client;
use Mailjet\Resources;

class MailjetService
{
    private $key_public = "807e91f4258a1e56bd2f5ab59103c7b5" ;
    private $key_secret = "2d07cc5225bad5b45dae6895e8a578cf" ;

   public function send($to_email, $to_name, $subject, $content)
   {
        $mj = new Client( $this->key_public, $this->key_secret , true, ['version' => 'v3.1']) ;

        // Define your request body

        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => "i.sylla481@laposte.net", // narguifive93@gmail.com 
                        'Name' => "NarguiFive chicha"
                    ],
                    'To' => [
                        [
                            'Email' => $to_email,
                            'Name' => $to_name
                        ]
                    ],
                    'TemplateID' => 3348144,
                    'TemplateLanguage' => true,
                    'Subject' => $subject,
                    'Variables' => [
                        'content' => $content,
                    ]
                ]
            ]
        ];

        // All resources are located in the Resources class

        $response = $mj->post(Resources::$Email, ['body' => $body]);

        // Read the response
        $response->success();
   }

}