<?php
Event::listen('app.CronicaUpdates',function($client_data){
    return BrainSocket::success(array('There was a Laravel App Success Event!'));
});
