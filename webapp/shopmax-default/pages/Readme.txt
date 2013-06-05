1. Modal Window:

The modal window can be triggered from anywhere. All it needs is the addition of these two classes: 

fancylink fancybox.iframe
an href.



2. Tooltip:

All linsk with a class of "tool-tip" will generate a tool-tip on hover.




3. Count down timer ( in Rush Hour page etc. )

- the first timer is set to a date, Feb 1.
- the second timer is set to countdown from 20 seconds.

You can see different variables in /js/main.js
 
On completing the second timer, the items beneath the 'left to buy' heading become fully visible. I'm enabling the buttons via js.

The JS function for count down in main.js is around

if ($('.countdown').exists()){
}

There are comments and references in there for changing it to be an AJAX call:
// example of server time retrieval from here http://keith-wood.name/countdownRef.html#serverSync




4.
In ¡°login_modal_window.html¡± page u can see popup window when u click on ¡°LOGIN¡± link in header part

In ¡°select_product_modal_window.html¡± page u can see popup window when u click on ¡°CHECKOUT¡± button in header part at rightside

In ¡°select_category_modal_window_v2.html¡± page u can see popup window when u click on ¡°VIEWCART¡± button in header part at rightside

In these 3 pages ( maybe there are more elsewhere ), it's using both Fancybox 1.3.4 and Fancybox 2.1.4, whereas in 1. above it's using Fancybox 2. Please change all pages to use only Fancybox 2.





5.
For styles in create_promo_* pages, use create_promo_free_shipping.html as a reference.







