@extends('author.header')

@section('content')

<table class="table">
  <thead>
    <tr>
      <th class="w15 ta_s">Название урока</th>
      <th class="w">Количество загрузок</th>
      <th class="w">Количество 5</th>
      <th class="w">Количество 4</th>
      <th class="w">Количество 3</th>
      <th class="w">Количество 2</th>

    </tr>
  </thead>
  <tbody>
    @foreach ($stats as $s)
    <tr>
      <td class="w15 ta_s">{{$s->title}}</td>
      <td class="w">{{$s->h}}</td>
      <td class="w">{{$s->c_5}}</td>
      <td class="w">{{$s->c_4}}</td>
      <td class="w">{{$s->c_3}}</td>
      <td class="w">{{$s->c_2}}</td>
      
    </tr>
    @endforeach
  </tbody>
</table>
@endsection