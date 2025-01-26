@extends('author.header')

@section('title', 'Задачи')
@section('content')
    <span class="fsz_1_2 c_dp ff_m">Уроки, в которых есть задания</span>
    <div class="df fdr_c g1 w78">
        <div class="df fdr_r g1 ff_mr fsz_1_2">
            <div class="w3">id</div>
            <div class="w14">Заголовок курса</div>
            <div class="w12">Количество задач</div>
            <div class="w12">Подробнее</div>
        </div>
        @foreach ($lessons as $les)
            <div class="df fdr_r g1 ff_mr fsz_1">
                <div class="w3">{{$les->id}}</div>
                <div class="w14">{{$les->title}}</div>
                <div class="w12">{{$les->task}}</div>
                <div class="w12"><a href="{{route('more_hwork', ['id'=>$les->id])}}" class="c_dp">Подробнее</a></div>
            </div>
            
        @endforeach
    </div>
@endsection