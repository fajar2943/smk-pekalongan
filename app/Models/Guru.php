<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guru extends Model
{
    use HasFactory;
    protected $table = 'guru';
    protected $fillable = ['nama', 'telepon', 'alamat'];

    public function mapel()
    {
        //relasi satu guru punya banyak mapel
        return $this->hasMany(Mapel::class);
    }
}
