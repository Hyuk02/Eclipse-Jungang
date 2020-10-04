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
</head>
<body>
  
<div class="container mt-3">
  <h1>Input Group Buttons</h1>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <button class="btn btn-outline-primary" type="button">Basic Button</button>  
    </div>
    <input type="text" class="form-control" placeholder="Some text">
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-append">
      <button class="btn btn-success" type="submit">Go</button>  
     </div>
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="Something clever..">
    <div class="input-group-append">
      <button class="btn btn-primary" type="button">OK</button>  
      <button class="btn btn-danger" type="button">Cancel</button>  
     </div>
  </div>
</div>

<div class="container mt-3">
  <h3>Input Groups with Dropdown Button</h3>
  <p>Add a dropdown button in the input group. Note that you don't need the .dropdown wrapper, as you normally would.</p>
  <form>
    <div class="input-group mt-3 mb-3">
      <div class="input-group-prepend">
        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
          Dropdown button
        </button>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Link 1</a>
          <a class="dropdown-item" href="#">Link 2</a>
          <a class="dropdown-item" href="#">Link 3</a>
        </div>
      </div>
      <input type="text" class="form-control" placeholder="Username">
    </div>
  </form>
</div>


</body>
</html>
