<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class SMSController extends Controller
{
    public function send()
    {
        // $balance = $this->checkSMSBalance();
        // dd($balance);
        // if ($balance['status'] === 'success') {
        //     echo "Balance: " . $balance['balance'];
        // } else {
        //     echo "Error: " . $balance['message'];
        // }

        $response = $this->sendSMS('+94770687287', 'Global Test', 'This is a test message');
        dd($response['message']);
        if ($response['status'] === 'success') {
            echo "Message sent successfully!";
        } else {
            echo "Failed to send message.";
        }
    }

    function sendSMS($recipient, $senderId, $message)
    {
        $apiToken = '207|pK7TS8wX9bYD2Hky0WnIG61g7J3p8SIf5HeL5V20'; // Replace with your API token
        $url = 'https://app.fitsms.lk/api/v3/sms/send';

        $client = new Client();
        try {
            $response = $client->post($url, [
                'headers' => [
                    'Authorization' => 'Bearer ' . $apiToken,
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json',
                ],
                'json' => [
                    'recipient' => $recipient, // Ensure number is formatted correctly
                    'sender_id' => $senderId,
                    'type' => 'plain',
                    'message' => $message,
                ],
            ]);

            return json_decode($response->getBody(), true);
        } catch (\Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    function checkSMSBalance()
    {
        $apiToken = '207|pK7TS8wX9bYD2Hky0WnIG61g7J3p8SIf5HeL5V20'; // Replace with your API token
        $url = 'https://app.fitsms.lk/api/v3/balance';

        $client = new Client();
        try {
            $response = $client->get($url, [
                'headers' => [
                    'Authorization' => 'Bearer ' . $apiToken,
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json',
                ],
            ]);

            return json_decode($response->getBody(), true);
        } catch (\Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }
}
