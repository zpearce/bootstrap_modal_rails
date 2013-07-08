# Bootstrap Modal v2.1
[![Gem Version](https://badge.fury.io/rb/bootstrap_modal_rails.png)](http://badge.fury.io/rb/bootstrap_modal_rails)

See live demo [here](http://jschr.github.com/bootstrap-modal/).

Extends Bootstrap's native modals to provide additional functionality. Introduces a **ModalManager** class that operates behind the scenes to handle multiple modals by listening on their events. 

A single ModalManager is created by default on body and can be accessed through the jQuery plugin interface.

    $('body').modalmanager('loading');

Bootstrap-Modal can be used as a replacement for Bootstrap's Modal class or as a patch to the library.

Overview
-----------

+ Backwards compatible
+ Responsive
+ Stackable
+ Full width
+ Load content via AJAX
+ Disable background scrolling


Installation
-----------

Add this line to your application's Gemfile:

    gem 'bootstrap_modal_rails', '~> 2.1.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap_modal_rails

Options
-----------

In addition to the standard bootstrap options, you now have access to the following options

**Modal**

+ **width**
Set the inital width of the modal.

+ **height**
Set the inital height of the modal.

+ **maxHeight**
Set the max-height of the modal-body.

+ **loading**
Toggle the loading state.

+ **spinner**
Provide a custom image or animation for the loading spinner.

+ **consumeTab**
Used to enable tabindexing for modals with `data-tabindex`. This is set to true by default.

+ **focusOn**
The element or selector to set the focus to once the modal is shown.

+ **attentionAnimation**
Set the animation used by the `attention` method. Any animation in [animate.css](http://daneden.me/animate/) is supported but only the *shake* animation is included by default.

+ **modalOverflow**
Set this property to true for modals with highly dynamic content. This will force the modal to behave as if it is larger than the viewport.

+ **manager**
Set the modal's manager. By default this is set to the `GlobalModalManager` and will most likely not need to be overridden.

**ModalManager**

+ **loading**
Toggle the loading state.

+ **backdropLimit**
Limit the amount of backdrops that will appear on the page at the same time.

+ **spinner**
Provide a custom image or animation for the loading spinner.

Disable Background Scrolling
-----------

If you want to prevent the background page from scrolling (see [demo](http://jschr.github.com/bootstrap-modal/) for example) you must wrap the page contents in a `<div class="page-container">`. For example:

  <body>
    <div class="page-container">
      <div class="navbar navbar-fixed-top">...</div>
      <div class="container">...</div>
    </div>
  </body>

The reason for doing this instead of just simply setting `overflow: hidden` when a modal is open is to avoid having the page shift as a result of the scrollbar appearing/disappearing. This also allows the document to be scrollable when there is a tall modal but only to the height of the modal, not the entire page.

Constrain Modal to Window Size
-----------
  
You can bind the the height of the modal body to the window with something like this:
  
    $.fn.modal.defaults.maxHeight = function(){
        // subtract the height of the modal header and footer
        return $(window).height() - 165; 
    }
  
**Note:** This will be overwritten by the responsiveness and is only set when the modal is displayed, not when the window is resized.
  
Tab Index for Modal Forms
-----------
You can use `data-tabindex` instead of the default `tabindex` to specify the tabindex within a modal.

    <input type="text" data-tabindex="1" />
    <input type="text" data-tabindex="2" />

See the stackable example on the [demo](http://jschr.github.com/bootstrap-modal/) page for an example.

Contributing
-----------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Thanks
-----------

Thanks to [Jordan Schroter](https://github.com/jschr) for creating this excellent bootstrap extension

