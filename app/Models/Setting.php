<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = [
        'businessname',
        'registrationno',
        'registrationtype',
        'contactperson',
        'contact',
        'email',
        'address1',
        'address2',
        'city',
        'logo',
        'greetingmessage',
        'devname',
        'devcontact',
        'startdate',
        'loyaltypoints',
        'emailnotification',
        'smsnotification',
    ];
}
