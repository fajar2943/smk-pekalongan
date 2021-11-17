<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{
    use HasFactory;
    use Sluggable;

    protected $fillable = ['title', 'content', 'thumbnail', 'slug', 'user_id'];

    //carbon(untuk format date sesuai kemauan)
    protected $date = ['created_at'];

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function thumbnail()
    {
        // if ($this->thumbnail) {
        //     return $this->thumbnail;
        // } else {
        //     return asset('default.jpg');
        // }
        //
        //

        // if (!$this->thumbnail) {
        //     return asset('default.jpg');
        // }

        // return $this->thumbnail;

        //shorthand dari dua tipe koding di atas
        return !$this->thumbnail ? asset('default.jpg') : $this->thumbnail;
    }
}
