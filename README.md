# sumup_flutter

Bridge with native Sumup SDK, supporting Air, Air Lite or PIN+ Terminal

/!\ WORK IN PROGRESS /!\  
Currently still testing and developing full implementation of the SDK. A light well-tested version 
of this SDK will be provided soon. Optional things like tips, receipts, additionnal infos...  are 
not the priority and will be integrated in future versions.

Feel free to add your contribution to this project by submitting pull request or opening issues

## Getting Started

First of all you'll need an API key from SumUp. You can ask for one there:
[SumUp Dashboard](https://me.sumup.com/developers). This will let you customize screens too, with
your product name and logo.

You'll need to provide Application IDs in order to get an API key. Don't forget to provide the 
Android and iOS one as they are different most of the time.

## Usage

### Authentication
First of all you'll need to authenticate with your API key provided the step before.
No verifications are made here, so paste the good key in order to prevent login errors from
appearing.
To authenticate, just call the following at application launch: 

~~~~
SumupFlutter.authenticate("aeb8452f-8e21-4a4d-84ae-7cb3a2a5ba27");
~~~~

### Show login window

You'll then need your user to login with its personnal account if it isn't already the case.
To check if the user is already logged in, call:

~~~~
await SumupFlutter.isLoggedIn();
~~~~

If `true`, then the user is already logged in, then no need to show the login window. if `false`
then consider to show login screen with the following:

~~~~
SumupFlutter.presentLoginView()
~~~~

One improvement that will be made in the future is to handle the answer of the login view.
Currently, I recommend making a call before calling checkout just to ensure user is connected.

### Launch Checkout Process

The checkout process is currently very simple, and fits in a `SumupCheckoutRequest` object that needs:
 - amount (String)
 - title (String)
 - currencyCode (String - ISO 4217:2015)
 
Just create a new `SumupCheckoutRequest` on the fly while calling the checkout method, e.g:

~~~~
SumupFlutter.checkout(new SumupCheckoutRequest(amount: "12.0", title: "My Sumup Payment", currencyCode: "EUR")
~~~~

That's it !

Currently a lot of tests are being done on my side to ensure everything works well.