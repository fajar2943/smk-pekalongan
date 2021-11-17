<?php

use App\Models\Siswa;
use App\Models\Guru;

function ranking5Besar()
{
    $siswa = Siswa::all();
    $siswa->map(function ($s) {
        $s->rataRataNilai = $s->rataRataNilai();
        return $s;
    });
    //sortBy/sortByDesc merupakan helper laravel utk mengurutkan nilai dari tinggi ke rendah
    //take adalah helper untuk beberapa looping tertentu
    $siswa = $siswa->sortByDesc('rataRataNilai')->take(5);
    return $siswa;
}

function totalSiswa()
{
    return Siswa::count();
}

function totalGuru()
{
    return Guru::count();
}
