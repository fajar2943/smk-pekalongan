<?php

use App\Http\Controllers\SiswaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [SiteController::class, 'home']);
Route::get('/register', [SiteController::class, 'register']);
Route::post('/postregister', [SiteController::class, 'postregister']);



Route::get('/login', [AuthController::class, 'login'])->name('login');
Route::post('/postlogin', [AuthController::class, 'postlogin']);
Route::get('/logout', [AuthController::class, 'logout']);

// Route::get('/siswa', 'SiswaController@index');
Route::group(['middleware' => ['auth', 'checkRole:admin']], function () {
    Route::get('/siswa', [SiswaController::class, 'index']);
    Route::post('/siswa/create', [SiswaController::class, 'create']);
    Route::get('/siswa/{siswa}/edit', [SiswaController::class, 'edit']);
    Route::post('/siswa/{siswa}/update', [SiswaController::class, 'update']);
    Route::get('/siswa/{siswa}/delete', [SiswaController::class, 'delete']);
    Route::get('/siswa/{siswa}/profile', [SiswaController::class, 'profile']);
    Route::post('/siswa/{siswa}/addnilai', [SiswaController::class, 'addnilai']);
    Route::get('/siswa/{siswa}/{idmapel}/deletenilai', [SiswaController::class, 'deletenilai']);
    Route::get('/siswa/exportexcel', [SiswaController::class, 'exportexcel']);
    Route::get('/siswa/exportpdf', [SiswaController::class, 'exportpdf']);
    Route::get('/guru/{id}/profile', [GuruController::class, 'profile']);
    Route::get('/posts', [PostController::class, 'index'])->name('posts.index');
    Route::get('/posts/add', [PostController::class, 'add'])->name('posts.add');
    Route::post('/posts/create', [PostController::class, 'create'])->name('posts.create');
});

Route::group(['middleware' => ['auth', 'checkRole:admin,siswa']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index']);
});

Route::get('/{slug}', [SiteController::class, 'singlepost'])->name('site.single.post');
