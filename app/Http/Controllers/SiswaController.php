<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Siswa;
use App\Models\Mapel;
use App\Models\User;
//load  maatwebsite excel
use App\Exports\SiswaExport;
use Maatwebsite\Excel\Facades\Excel;
//load pdf dari
use PDF;

class SiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->has('cari')) {
            $data_siswa = Siswa::where('nama_depan', 'LIKE', '%' . $request->cari . '%')->get();
        } else {

            $data_siswa = Siswa::all();
        }
        return view('siswa.index', compact('data_siswa'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            'nama_depan' => 'required|min:5',
            'nama_belakang' => 'required',
            'email' => 'required|email|unique:users',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'avatar' => 'mimes:jpg,png'
        ]);
        //insert ke tabel users
        $user = new User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email = $request->email;
        $user->password = bcrypt('rahasia');
        $user->remember_token = uniqid();
        $user->save();

        //insert ke tabel siswa
        $request->request->add(['user_id' => $user->id]);
        $siswa = Siswa::create($request->all());

        if ($request->hasFile('avatar')) {
            $request->file('avatar')->move('images/', $request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }

        return redirect('/siswa')->with('sukses', 'Data berhasil diinput!');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Siswa $siswa)
    {

        return view('siswa/edit', compact('siswa'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Siswa $siswa)
    {

        $siswa->update($request->all());
        if ($request->hasFile('avatar')) {
            $request->file('avatar')->move('images/', $request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }
        return redirect('/siswa')->with('sukses', 'Data berhasil diupdate!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function delete(Siswa $siswa)
    {

        $siswa->delete($siswa);
        return redirect('/siswa')->with('sukses', 'Data berhasil dihapus!');
    }

    public function profile(Siswa $siswa)
    {

        $matapelajaran = Mapel::all();

        //menyiapkan data untuk chart
        $categories = [];
        $data = [];
        foreach ($matapelajaran as $mp) {
            if ($siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()) {
                $categories[] = $mp->nama;
                $data[] = $siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()->pivot->nilai;
            }
        }

        return view('siswa.profile', ['siswa' => $siswa, 'matapelajaran' => $matapelajaran, 'categories' => $categories, 'data' => $data]);
    }

    public function addnilai(Request $request, Siswa $siswa)
    {

        if ($siswa->mapel()->where('mapel_id', $request->mapel)->exists()) {
            return redirect('siswa/' . $siswa . '/profile')->with('error', 'Data mata pelajaran sudah ada!');
        }
        $siswa->mapel()->attach($request->mapel, ['nilai' => $request->nilai]);
        return redirect('siswa/' . $siswa->id . '/profile')->with('sukses', 'Data nilai berhasil dimasukan!');
    }

    public function deletenilai(Siswa $siswa, $idmapel)
    {
        $siswa = Siswa::find($siswa);
        // detach digunakan untuk melepaskan pivot
        $siswa->mapel()->detach($idmapel);
        return redirect()->back()->with('sukses', 'Data nilai berhasil dihapus!');
    }

    //function export excel
    public function exportexcel()
    {
        return Excel::download(new SiswaExport, 'Siswa.xlsx');
    }

    //export pdf garis merah di bawah gpp kok
    public function exportpdf()
    {
        $siswa = Siswa::all();
        $pdf = PDF::loadView('export.siswapdf', ['siswa' => $siswa]);
        //kode yg di komen di bawah utk yg landscape,dan yang atas ini(tdk di komen) utk portrait
        //$pdf = PDF::loadView('export.siswapdf', ['siswa' => $siswa])->setPaper('a4', 'landscape');
        return $pdf->download('siswa.pdf');
    }
}
