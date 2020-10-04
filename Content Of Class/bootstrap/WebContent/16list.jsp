<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>List Group With Linked Items</h2>
  <div class="list-group">
    <a href="#" class="list-group-item active">First item</a>
    <a href="#" class="list-group-item">Second item</a>
    <a href="#" class="list-group-item">Third item</a>
  </div>
</div>

<div class="list-group">
  <a href="#" class="list-group-item active">Disabled item</a>
  <a href="#" class="list-group-item ">Disabled item</a>
  <a href="#" class="list-group-item disabled">Third item</a>
</div>

<div class="container">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">First item</li>
    <li class="list-group-item">Second item</li>
    <li class="list-group-item">Third item</li>
    <li class="list-group-item">Fourth item</li>
  </ul>
</div>

<ul class="list-group list-group-horizontal">
    <li class="list-group-item"><a href="#">First item</a></li>
    <li class="list-group-item"><a href="#"> item</a></li>
    <li class="list-group-item"><a href="#">Third item</a></li>
    <li class="list-group-item"><a href="#">Fourth item</a></li>
  </ul>

<ul class="list-group">
  <li class="list-group-item list-group-item-success">Success item</li>
  <li class="list-group-item list-group-item-secondary">Secondary item</li>
  <li class="list-group-item list-group-item-info">Info item</li>
  <li class="list-group-item list-group-item-warning">Warning item</li>
  <li class="list-group-item list-group-item-danger">Danger item</li>
  <li class="list-group-item list-group-item-primary">Primary item</li>
  <li class="list-group-item list-group-item-dark">Dark item</li>
  <li class="list-group-item list-group-item-light">Light item</li>
</ul>


<div class="list-group list-group-horizontal">
    <a href="#" class="list-group-item list-group-item-action">Action item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-success">Success item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">Secondary item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-info">Info item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Warning item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Danger item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-primary">Primary item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-dark">Dark item</a>
    <a href="#" class="list-group-item list-group-item-action list-group-item-light">Light item</a>
  </div>
  
<ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Inbox
    <span class="badge badge-primary badge-pill">12</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Ads
    <span class="badge badge-primary badge-pill">50</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Junk
    <span class="badge badge-primary badge-pill">99</span>
  </li>
</ul>
  
</body>
</html>
