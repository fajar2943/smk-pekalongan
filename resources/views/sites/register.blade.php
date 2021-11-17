@extends('layouts.frontend')

@section('content')
    
<div class="all-title-box">
    <div class="container text-center">
        <h1>Pendaftaran<span class="m_1">Sekolah Terfavorit di Jawa Tengah</span></h1>
    </div>
</div>

<div id="contact" class="section wb">
    <div class="container">
        <div class="section-title text-center">
            <h3>Pendaftaran Online!</h3>
            <p class="lead">Segera daftarkan diri kamu. <br>Kami akan menunggumu di kelas!</p>
        </div><!-- end title -->

        <div class="row">
            <div class="col-xl-6 col-md-12 col-sm-12">
                <div class="contact_form">
                    <div id="message"></div>
                    {!! Form::open(['url' => '/postregister']) !!}
                        <div class="row row-fluid">

                            {!! Form::text('nama_depan', '', ['class' => 'form-control', 'placeholder' => 'Nama Depan']); !!}
                            {!! Form::text('nama_belakang', '', ['class' => 'form-control', 'placeholder' => 'Nama Belakang']); !!}
                            {!! Form::text('agama', '', ['class' => 'form-control', 'placeholder' => 'Agama']); !!}
                            {!! Form::textarea('alamat', '', ['class' => 'form-control', 'placeholder' => 'Alamat']); !!}
                            <div class="form-select mb-4" id="service-select">
                                {!! Form::select('jenis_kelamin', ['' => 'Pilih jenis kelamin','L' => 'Laki-laki', 'P' => 'Perempuan']); !!}
                            </div>
                            {!! Form::email('email', '', ['class' => 'form-control', 'placeholder' => 'Email']); !!}
                            {!! Form::password('password',['class' => 'form-control', 'placeholder' => 'Password']); !!}
                            
                            <div class="text-center">
                                <button type="submit" value="Kirim" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block">Daftar Sekarang</button>
                            </div>
                        </div>
                    {!! Form::close() !!}
                </div>
            </div><!-- end col -->
            <div class="col-xl-6 col-md-12 col-sm-12">
                <div class="map-box">
                    <img src="{{asset('/frontend')}}/images/about_02.jpg" width="100%">
                </div>
            </div>
        </div><!-- end row -->
    </div><!-- end container -->
</div>

@endsection