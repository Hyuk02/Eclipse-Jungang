<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Typography</h2>
  <p class="text-left">Left-aligned text.</p>
  <p class="text-right">Right-aligned text.</p>      
  <p class="text-center">Center-aligned text.</p>
  <p class="text-justify">Justified text. Justified text. Justified text. Justified text. Justified text. Justified text.</p>      
  <p class="text-nowrap">No wrap text. No wrap text. No wrap text. No wrap text.</p>
  <p><strong>Tip:</strong> Try to resize the browser window to see the behaviour of justify and nowrap.</p>      
</div>

<div class="container">
  <h2>Typography</h2>
  <p class="text-lowercase">Lowercased text.</p>
  <p class="text-uppercase">Uppercased text.</p>      
  <p class="text-capitalize">Capitalized text.</p>
</div>

<div class="container">
  <h2>Typography</h2>
  <p>The class .list-unstyled removes the default list-style and left margin on list items (immediate children only):</p>
  <ul class="list-unstyled">
    <li>Coffee</li>
    <li>Tea
      <ul>
        <li>Black tea</li>
        <li>Green tea</li>
      </ul>
    </li>
    <li>Milk</li>
  </ul>
</div>
<div class="container">
  <h2>Typography</h2>
  <p>The class .list-inline places all list items on a single line:</p>
  <ul class="list-inline">
    <li>Coffee</li>
    <li>Tea</li>
    <li>Milk</li>
  </ul>
</div>

<div class="container">
  <h2>Typography</h2>
  <p>Use the .dl-horizontal class line up the description list side-by-side when the browser window expands:</p>
  <dl class="dl-horizontal">
    <dt>Coffee</dt>
    <dd>- black hot drink</dd>
    <dt>Milk</dt>
    <dd>- white cold drink</dd>
  </dl>     
  <p><strong>Tip:</strong> Try to resize the browser window to see the behaviour of the description list.</p>      
</div>

<div class="container">
  <h2>Code</h2>    
     
  <p>For multiple lines of code, use the pre element:</p>
  <pre>Text in a pre element
  is displayed in a fixed-width
  font, and it preserves
  both      spaces and
  line breaks.</pre>

  <p>If you add the .pre-scrollable class, the pre element gets a max-height of 350px and provides a y-axis scrollbar:</p>
  <pre class="pre-scrollable">Text in a pre element
  is displayed in a fixed-width
  font, and it preserves
  both      spaces and
  line breaks.</pre>
</div>

</body>
</html>
