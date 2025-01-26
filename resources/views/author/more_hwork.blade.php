@extends('author.header')

@section('title', $hwork[0]->title)
@section('content')
    <h1 class="ff_ml fsz_1_2 c_dp">Задания по курсу: "{{$hwork[0]->title}}"</h1>

    <!-- <a href="" class="fsz_0_8 ff_mr">К проверенным</a> -->
    <div class="df fdr_c g1 w78">
        <div class="df fdr_r g1 ff_mr fsz_1_2">
            <div class="w3">id</div>
            <div class="w14">Заголовок курса</div>
            <div class="w24">Текст задачи</div>
            <div class="w12">Проверить</div>
        </div>
        @foreach ($hwork as $les)
            <div class="df fdr_r g1 ff_mr fsz_1">
                <div class="w3">{{$les->id}}</div>
                <div class="w14">{{$les->title}}</div>
                <div class="w24">{{$les->task}}</div>
                <div class="w12"><a href="{{route('uploads', ['id'=>$les->id])}}" class="c_dp">К проверке</a></div>
            </div>
            
        @endforeach
    </div>
@endsection