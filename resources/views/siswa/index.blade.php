@extends('layouts.master')

@section('content')
    <div class="main">
        <div class="main-content">
            <div class="container-fluid">
                {{-- @if (session('sukses'))
                    <div class="alert alert-success" role="alert">
                        {{session('sukses')}}
                    </div>
                @endif --}}
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Data Siswa</h3>
                                <!-- Button trigger modal -->
                                <div class="right">

                                    <a href="/siswa/exportexcel" class="btn btn-sm btn-primary">Export Excel</a>
                                    <a href="/siswa/exportpdf" class="btn btn-sm btn-primary">Export PDF</a>

                                    <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal">
                                        <i class="lnr lnr-plus-circle"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Nama Depan</th>
                                            <th>Nama Belakang</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Agama</th>
                                            <th>Alamat</th>
                                            <th>Rata-rata Nilai</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($data_siswa as $siswa)
            
                                        <tr>
                                            <td><a href="/siswa/{{$siswa->id}}/profile">{{$siswa->nama_depan}}</a></td>
                                            <td><a href="/siswa/{{$siswa->id}}/profile">{{$siswa->nama_belakang}}</a></td>
                                            <td>{{$siswa->jenis_kelamin}}</td>
                                            <td>{{$siswa->agama}}</td>
                                            <td>{{$siswa->alamat}}</td>
                                            <td>{{$siswa->rataRataNilai()}}</td>
                                            <td>
                                                <a href="/siswa/{{$siswa->id}}/edit" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="#" class="btn btn-danger btn-sm delete" siswa-id="{{$siswa->id}}">Delete</a>
                                            </td>
                                        </tr>
                                            
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/siswa/create" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group {{$errors->has('nama_depan') ? ' has-error' : ''}}">
                            <label for="exampleInputEmail1">Nama Depan</label>
                            <input type="text" name="nama_depan" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="{{old('nama_depan')}}">
                            @if ($errors->has('nama_depan'))
                                <span class="help-block">{{$errors->first('nama_depan')}}</span>
                            @endif
                        </div>
                        <div class="form-group {{$errors->has('nama_belakang') ? ' has-error' : ''}}">
                            <label for="exampleInputEmail1">Nama Belakang</label>
                            <input type="text" name="nama_belakang" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="{{old('nama_belakang')}}">
                            @if ($errors->has('nama_belakang'))
                                <span class="help-block">{{$errors->first('nama_belakang')}}</span>
                            @endif
                        </div>
                        <div class="form-group {{$errors->has('email') ? ' has-error' : ''}}">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="{{old('email')}}">
                            @if ($errors->has('email'))
                                <span class="help-block">{{$errors->first('email')}}</span>
                            @endif
                        </div>
                        <div class="form-group {{$errors->has('jenis_kelamin') ? ' has-error' : ''}}">
                            <label for="exampleFormControlSelect1">Jenis Kelamin</label>
                            <select name="jenis_kelamin" value="{{old('jenis_kelamin')}}" class="form-control" id="exampleFormControlSelect1">
                            <option value="L"{{(old('jenis_kelamin') == 'L') ? ' selected' : ''}}>Laki-laki</option>
                            <option value="P"{{(old('jenis_kelamin') == 'P') ? ' selected' : ''}}>Perempuan</option>
                            </select>
                            @if ($errors->has('jenis_kelamin'))
                                <span class="help-block">{{$errors->first('jenis_kelamin')}}</span>
                            @endif
                        </div>
                        <div class="form-group {{$errors->has('agama') ? ' has-error' : ''}}">
                            <label for="exampleInputEmail1">Agama</label>
                            <input type="text" name="agama" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="{{old('agama')}}">
                            @if ($errors->has('agama'))
                                <span class="help-block">{{$errors->first('agama')}}</span>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Alamat</label>
                            <textarea name="alamat" class="form-control" id="exampleFormControlTextarea1" rows="2">{{old('alamat')}}</textarea>
                        </div>
                        <div class="form-group {{$errors->has('avatar') ? ' has-error' : ''}}">
                            <label for="exampleInputEmail1">Avatar</label>
                            <input type="file" name="avatar" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            @if ($errors->has('avatar'))
                                <span class="help-block">{{$errors->first('avatar')}}</span>
                            @endif
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('footer')
    
    <script>
        $('.delete').click(function(){
            let siswa_id = $(this).attr('siswa-id');
                Swal.fire({
                        title: 'Yakin?',
                        text: "Mau hapus data siswa dengan id "+siswa_id+" ?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#333',
                        confirmButtonText: 'Yes'
                    }).then((result) => {
                    if (result.isConfirmed) {
                        window.location = "/siswa/"+siswa_id+"/delete";
                    }
                })
        });
    </script>
@endsection