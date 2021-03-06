<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <style>
  .border {
    display: inline-block;
    width: 70px;
    height: 70px;
    margin: 6px;
  }

  span {
    display: inline-block;
    width: 70px;
    height: 70px;
    margin: 6px;
    background-color: #555;
  }

  </style>
</head>
<body>

<div class="container">
  <h2>Borders</h2>
  <p>Use the border classes to add or remove borders from an element:</p> 
  <span class="border"></span>
  <span class="border border-0"></span>
  <span class="border border-top-0"></span>
  <span class="border border-right-0"></span>
  <span class="border border-bottom-0"></span>
  <span class="border border-left-0"></span>
</div>

<div class="container">
<span class="border border-primary"></span>
<span class="border border-secondary"></span>
<span class="border border-success"></span>
<span class="border border-danger"></span>
<span class="border border-warning"></span>
<span class="border border-info"></span>
<span class="border border-light"></span>
<span class="border border-dark"></span>
<span class="border border-white"></span>

<span class="rounded-sm"></span>
<span class="rounded"></span>
<span class="rounded-lg"></span>
<span class="rounded-top"></span>
<span class="rounded-right"></span>
<span class="rounded-bottom"></span>
<span class="rounded-left"></span>
<span class="rounded-circle"></span>
<span class="rounded-0"></span>
</div>

<div class="container">
  <h2>Float</h2>
  <p>Float an element to the right with the .float-right class or to the left with .float-left, and clear floats with the .clearfix class.</p> 
  <div class="clearfix">
    <span class="float-left">Float left</span>
    <span class="float-right">Float right</span>
  </div>
</div>

<div class="container">
  <h1>Width Utilities</h1>
  <p>Set the width of an element with the w-* classes:</p>
  <div class="w-25 bg-warning">Width 25%</div>
  <div class="w-50 bg-warning">Width 50%</div>
  <div class="w-75 bg-warning">Width 75%</div>
  <div class="w-100 bg-warning">Width 100%</div>
  <div class="mw-100 bg-warning">Max Width 100%</div>
</div>

<div style="height:200px;background-color:#ddd">
  <div class="h-25 bg-warning">Height 25%</div>
  <div class="h-50 bg-warning">Height 50%</div>
  <div class="h-75 bg-warning">Height 75%</div>
  <div class="h-100 bg-warning">Height 100%</div>
  <div class="mh-100 bg-warning" style="height:500px">Max Height 100%</div>
</div>

<div class="container">
  <h1>Spacing Utilities</h1>
  <p>Set the spacing of an element with the {property}{sides}-{breakpoint}-{size} classes. Omit breakpoint if you want the padding or margin to work on all screen sizes.</p>
  <div class="pt-4 bg-warning">I only have a top padding (1.5rem = 24px)</div>
  <div class="p-5 bg-success">I have a padding on all sides (3rem = 48px)</div>
  <div class="m-5 pb-5 bg-info">I have a margin on all sides (3rem = 48px) and a bottom padding (3rem = 48px)</div>
</div>

<div class="container">
  <h1>Vertical Align</h1>
  <p>Change the alignment of elements with the align classes (only works on inline, inline-block, inline-table and table cell elements):</p>
  <span class="align-baseline">baseline</span>
  <span class="align-top">top</span>
  <span class="align-middle">middle</span>
  <span class="align-bottom">bottom</span>
  <span class="align-text-top">text-top</span>
  <span class="align-text-bottom">text-bottom</span>
</div>

</body>
</html>
