<?php
include __DIR__ . '/../header.php';
?>

<link href="/css/managestyle.css" rel="stylesheet">

<div class="container-fluid center mt-3">
    <h1 class="">Manage Restaurants</h1>
    <a class="btn btn-success ms-5 py-3" href="/managerestaurants/createRestaurant">Create New Restaurant</a>
</div>
<div class="container-fluid mt-3 max">
    <table class="table table-striped-rows">
        <thead>
        <tr>
            <th>Restaurant Name</th>
            <th>Category</th>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($restaurantModel as $restaurant) { ?>
             <tr>
             <td><?php echo $restaurant->name ?></td>
             <td><?php echo $restaurant->restaurantCategory ?></td>
             <td><a href='/managerestaurants/editRestaurant?id=<?php echo $restaurant->id ?>'>Edit</a>
              |
             <a href='/managerestaurants/deleteRestaurantById?id=<?php echo $restaurant->id ?>' onclick="return confirm('Are you sure?')">Delete</a>
             </td>
             </tr>
        <?php } ?>
        </tbody>
    </table>
</div>

<?php
include __DIR__ . '/../footer.php';
?>
