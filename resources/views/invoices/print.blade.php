<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>POS - TS Retailly</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    p {
        margin-bottom: 0 !important;
        margin-block-end: 0 !important;
    }

    .header-section h2 {
        font-size: 1.5rem;
    }

    .header-section p {
        font-size: .75rem;
    }

    hr {
        margin: 0 !important;
    }
</style>

<body>
    <div>
        <div class="row">
            <div class="col-12 header-section" style="text-align: center;">
                <h2 style="margin-bottom: 0;">{{ $setting->businessname }}</h2>
                <p>{{ $setting->address1 }}, {{ $setting->address2 ? $setting->address2 . ',' : '' }}
                    {{ $setting->city }}
                </p>
                {{-- <p>{{ $setting->contact ?? '' }} </p> --}}
                <p><b>INVOICE</b>
                <p>
                    <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-12" style="font-size:12px">
                <p><b>Invoice No :</b> {{ $invoice->invoiceid }} </p>
                <table width="100%">
                    <tr>
                        <td>
                            <p><b>Name :</b> {{ $invoice->customer->name ?? 'Customer' }} </p>
                        </td>
                        <td style="text-align: right">
                            <p><b>Date :</b> {{ $invoice->created_at->format('Y-m-d') }} </p>
                        </td>
                    </tr>
                </table>


                <hr>
            </div>
            <div class="col-12">
                <table class="table-bordered" style="width: 100%; text-align:center; font-size:12px;">
                    <thead>
                        <th>භාණ්ඩය</th>
                        <th>ප්‍රමාණ</th>
                        <th>වෙළඳ මිල</th>
                        <th>අපේ මිල</th>
                        <th>මුදල</th>
                    </thead>
                    <tbody style="font-weight:bold">
                        @foreach ($invoicedetails as $detail)
                            <tr>
                                <td>{{ $detail->product->name_si }}</td>
                                <td>{{ $detail->quantity }}</td>
                                <td>{{ $detail->marketprice }}</td>
                                <td>{{ $detail->unitprice }}</td>
                                <td>{{ $detail->itemtotal }}</td>
                            </tr>
                        @endforeach
                        </tr>

                    </tbody>
                </table>
                <hr>
            </div>
            <div class="col-12">
                <table width="100%" style="font-size:12px">
                    <tr>
                        <th>Total</th>
                        <td style="text-align: right; font-weight:bold">{{ number_format($invoice->amount, 2) }}</td>
                    </tr>
                    @if ($invoice->discounttype != null)
                        <tr>
                            <th>Discount</th>
                            <td style="text-align: right; font-weight:bold">
                                {{ number_format($invoice->discountamount, 2) }}
                            </td>
                        </tr>
                        <tr>
                            <th>Amount</th>
                            <td style="text-align: right; font-weight:bold">{{ number_format($invoice->payable, 2) }}
                            </td>
                        </tr>
                    @endif
                    <tr>
                        <th>Payment</th>
                        <td style="text-align: right; font-weight:bold">{{ number_format($invoice->payment, 2) }}</td>
                    </tr>
                    <tr>
                        <th>Balance</th>
                        <td style="text-align: right; font-weight:bold">{{ number_format($invoice->balance, 2) }}</td>
                    </tr>
                </table>
                <hr>
            </div>
            @if ($invoice->markettotal - $invoice->amount + $invoice->discountamount > 0)
                <div class="col-12" style="text-align: center;">
                    <h5 style="font-size:12px; font-weight:bold">ඔබට ලැබුණු ලාභය රුපියල්</h5>
                    <h5>{{ $invoice->markettotal - $invoice->amount + $invoice->discountamount }}</h5>
                </div>
                <br>
            @endif
            @if (isset($invoice->customer))
                @if ($invoice->points > 0)
                    <div class="col-12" style="text-align: center; font-size:12px">
                        <p>බිල්පතට අදාල Loyalty Points ගණන - {{ $invoice->points }}</p>
                    </div>
                    <br>
                @endif
                @if ($invoice->customer->points > 0)
                    <div class="col-12" style="text-align: center; font-size:12px">
                        <p>සම්පූර්ණ Loyalty Points ගණන - {{ $invoice->customer->points }}</p>
                    </div>
                    <br>
                @endif
            @endif
            <div class="col-12" style="text-align: center; font-size:12px">
                <p style="margin-top: 5px;"><b> {{ $setting->greetingmessage }}</b></p>

            </div>
            <div class="col-12" style="text-align: center; font-size:11px">
                <p style="margin-top: 5px"><b>© Retailly - Software by TekSalad (Pvt) Ltd.</b></p>
                <p>072 341 7788 - www.teksalad.com</p>
                <br><br>
                <hr>
            </div>
            <div class="container-fluid print-controls">
                <div class="col-12">
                    <button id="btnPrint" class="btn btn-primary">Print</button>
                    <button id="btnCancel" class="btn btn-danger">Cancel</button>
                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
<script>
    $('#btnPrint').click(function() {
        $('.print-controls').hide();
        window.print();
        $('.print-controls').show();

    })

    $('#btnCancel').click(function() {
        var confirmation = confirm("Are you sure?");
        if (confirmation == true) {
            window.location.href = "{{ route('pos') }}";
        }
    })
</script>

</html>
