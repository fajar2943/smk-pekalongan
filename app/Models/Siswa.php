<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    use HasFactory;
    protected $table = 'siswa';
    protected $fillable = ['nama_depan', 'nama_belakang', 'jenis_kelamin', 'alamat', 'agama', 'avatar', 'user_id'];

    public function getAvatar()
    {
        if (!$this->avatar) {
            return asset('images/default.jpg');
        }
        return asset('images/' . $this->avatar);
    }

    public function mapel()
    {
        return $this->belongsToMany(Mapel::class)->withPivot(['nilai'])->withTimestamps();
    }

    public function rataRataNilai()
    {
        if ($this->mapel->isNotEmpty()) {

            //ambil nilai
            $total = 0;
            $hitung = 0;
            foreach ($this->mapel as $mapel) {
                $total += $mapel->pivot->nilai;
                $hitung++;
            }
            //round adlah helper laravel untuk membulatkan float/koma mnjdi bilangan bulat
            return round($total / $hitung);
        }

        return 0;
    }

    public function nama_lengkap()
    {
        return $this->nama_depan . ' ' . $this->nama_belakang;
    }
}
