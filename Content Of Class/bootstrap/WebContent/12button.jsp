<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Button Styles</h2>
  <button type="button" class="btn">Basic</button>
  <button type="button" class="btn btn-default">Default</button>
  <button type="button" class="btn btn-primary">Primary</button>
  <button type="button" class="btn btn-success">Success</button>
  <button type="button" class="btn btn-info">Info</button>
  <button type="button" class="btn btn-warning">Warning</button>
  <button type="button" class="btn btn-danger">Danger</button>
  <button type="button" class="btn btn-link">Link</button>      
</div>

<div class="container">
  <h2>Button Tags</h2>
  <a href="#" class="btn btn-info" role="button">Link Button</a>
  <button type="button" class="btn btn-info">Button</button>
  <input type="button" class="btn btn-info" value="Input Button">
  <input type="submit" class="btn btn-info" value="Submit Button">
</div>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Button Sizes</h2>
  <button type="button" class="btn btn-primary btn-lg">Large</button>
  <button type="button" class="btn btn-primary">Normal</button>    
  <button type="button" class="btn btn-primary btn-sm">Small</button>
  <button type="button" class="btn btn-primary btn-xs">XSmall</button>
</div>


<div class="container">
  <h2>Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-block">Button 1</button>
  <button type="button" class="btn btn-default btn-block">Button 2</button>

  <h2>Large Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-lg btn-block">Button 1</button>
  <button type="button" class="btn btn-default btn-lg btn-block">Button 2</button>

  <h2>Small Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-sm btn-block">Button 1</button>
  <button type="button" class="btn btn-default btn-sm btn-block">Button 2</button>
</div>


<div class="container">
  <h2>Button States</h2>
  <button type="button" class="btn btn-primary">Primary Button</button>
  <button type="button" class="btn btn-primary active">Active Primary</button>
  <button type="button" class="btn btn-primary disabled">Disabled Primary</button>
</div>

<div class="container">
  <h2>Button Group</h2>
  <p>The .btn-group class creates a button group:</p>
  <div class="btn-group">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
</div>

<div class="container">
  <h2>Button Groups - Set Sizes</h2>
  <p>Add class .btn-group-* to size all buttons in a button group.</p>
  <h3>Large Buttons:</h3>
  <div class="btn-group btn-group-lg">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
  <h3>Default Buttons:</h3>
  <div class="btn-group">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
  <h3>Small Buttons:</h3>
  <div class="btn-group btn-group-sm">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
  <h3>Extra Small Buttons:</h3>
  <div class="btn-group btn-group-xs">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
</div>

<div class="container">
  <h2>Vertical Button Group</h2>
  <p>Use the .btn-group-vertical class to create a vertical button group:</p>
  <div class="btn-group-vertical">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <button type="button" class="btn btn-primary">Sony</button>
  </div>
</div>

<div class="btn-group btn-group-justified">
  <a href="#" class="btn btn-primary">Apple</a>
  <a href="#" class="btn btn-primary">Samsung</a>
  <a href="#" class="btn btn-primary">Sony</a>
</div>

<div class="container">
  <h2>Nesting Button Groups</h2>
  <p>Nest button groups to create drop down menus:</p>
  <div class="btn-group">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <div class="btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      Sony <span class="caret"></span></button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#">Tablet</a></li>
        <li><a href="#">Smartphone</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="container">
  <h2>Split Buttons</h2>
  <div class="btn-group">
    <button type="button" class="btn btn-primary">Sony</button>
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a href="#">Tablet</a></li>
      <li><a href="#">Smartphone</a></li>
    </ul>
  </div>
</div>

<div class="container">
  <h2>Glyphicon Examples</h2>
  <p>Envelope icon: <span class="glyphicon glyphicon-envelope"></span></p>
  <p>Envelope icon as a link:
    <a href="#"><span class="glyphicon glyphicon-envelope"></span></a>
  </p>
  <p>Search icon: <span class="glyphicon glyphicon-search"></span></p>
  <p>Search icon on a button:
    <button type="button" class="btn btn-default">
      <span class="glyphicon glyphicon-search"></span> Search
    </button>
  </p>
  <p>Search icon on a styled button:
    <button type="button" class="btn btn-info">
      <span class="glyphicon glyphicon-search"></span> Search
    </button>
  </p>
  <p>Print icon: <span class="glyphicon glyphicon-print"></span></p>      
  <p>Print icon on a styled link button:
    <a href="#" class="btn btn-success btn-lg">
      <span class="glyphicon glyphicon-print"></span> Print 
    </a>
  </p> 
</div>
</body>
</html>

