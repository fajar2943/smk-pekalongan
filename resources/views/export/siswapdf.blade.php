<style>
    table, td, th {
      border: 1px solid black;
    }
    
    table {
      width: 100%;
      border-collapse: collapse;
    }
    </style>

<table class="table">
    <thead>
        <tr>
            <th>Nama Lengkap</th>
            <th>Jenis Kelamin</th>
            <th>Agama</th>
            <th>Alamat</th>
            <th>Rata-rata Nilai</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($siswa as $s)

        <tr>
            <td>{{$s->nama_lengkap()}}</td>
            <td>{{$s->jenis_kelamin}}</td>
            <td>{{$s->agama}}</td>
            <td>{{$s->alamat}}</td>
            <td>{{$s->rataRataNilai()}}</td>
        </tr>
            
        @endforeach
    </tbody>
</table>