@extends('header')

@section('title', $lesson->title)
@section('content')
{{--dd($lesson);--}}
<div class=" w80 h2 pos_r">

    <div id="background_modal" class="pos_f w99 h47 bg_lgr r_0 t_m_1_5 df ali_c jc_c">
        <div class="df fdr_c g1 w30 paa_1 bg_w br_03">
            <h1 class="ff_ml fsz_1_2">Оценка</h1>
            <form class="df fdr_c g1" action="{{route('rate_course')}}" method="POST">
                @csrf
                <input type="hidden" id="id_course" name="id_course" value="">
                <label for="" class="fsz_1 ff_mr df fdr_c g0_5">
                    На сколько вы оцениваете курс (1-10)?
                    <input required class="ou_n brc_lp w6 paa_1 br_03 fsz_1_2 ff_mr" type="number" name="rate" min="1" max="10" id="">
                </label>
                <div class="df fdr_r g1">
                    <a href="{{route('complete_course', ['id_course'=>$lesson->course_id])}}" class="td_n fsz_1 ff_mr btn_dp_lp w7 paa_0_5 br_03 ou_n">Пропустить</a>
                    <input class="fsz_1 ff_mr btn_dp_lp w8 paa_0_5 br_03 ou_n" type="submit" value="Оценить">
                </div>
            </form>
        </div>
    </div>

</div>
<div class="df fdr_c als_c g3 ptb_2 ali_c">
    <div class="df fdr_c ff_mr g1_5 w50">
        <span class="fsz_1_5 c_dp">Курс: {{$lesson->course}}</span>
        <span class="fsz_1_2 c_dp">Урок: {{$lesson->title}}</span>
    </div>
    <div class="w78 df fdr_c g1 ff_ml fsz_1 ali_c">
        @foreach ($content as $key=>$val)
            @foreach ($val as $k=>$v)
                @if($k == 'img')
                    <img class="w50" src="{{asset('img/lessons/'.$v)}}" alt="image_course">
                
                @elseif($k=='txt')
                    <div class="w50 paa_0_5 brc_lp br_03">{{$v}}</div>
                @endif
                <br>
               
            @endforeach
        @endforeach
        

        @if($lesson->task)
        <div class="df fdr_c g1 paa_0_5 w50 brc_lp br_03">
                 <h1 class="fsz_1_2 ff_ml c_dp">Задание</h1>
                <span class="fsz_1 ff_mr">{{$lesson->task}}</span>
        @if (strlen(trim($task_x)) < 5)

                <form id="form_end" action="{{route('end_lesson')}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <input type="file" name="file">
                    <input type="hidden" value="{{$lesson->course_id}}" name="id">
                    <input type="hidden" value="{{$lesson->id}}" name="lesson_id">
                    <input type="submit" value="Отправить">
                </form>
        @else 
        <div class="ff_mr fsz_1 c_lg c_gr">Уже загружено</div>
        @endif

            </div>
        @endif

    </div>
    <div class="df fdr_r jc_spb w52">
        @if ($before_id != null)
        <div class="df fdr_r g0_5 ali_c js_s als_s">
            <a class="paa_0_5  td_n btn_lp_dp ff_mr fsz_1 br_03 " href="{{route('one_lesson_student', ['id'=>$before_id, 'course'=>$lesson->course_id])}}">{{$before_title}}</a>
            <span class="ff_mr fsz_0_8 c_lg c_gr">Назад</span>
        </div>
        @endif
        <div class="w_a"></div>
        @if ($next_id != null)
        <div class="df fdr_r g0_5 ali_c js_e als_e">
            <span class="ff_mr fsz_0_8 c_lg c_gr">Следующий</span>
            <a class=" paa_0_5 td_n btn_lp_dp ff_mr fsz_1 br_03 " href="{{route('one_lesson_student', ['id'=>$next_id, 'course'=>$lesson->course_id])}}">{{$next_title}}</a>
        </div>
        @else
            @if ($completed)
                <div class="paa_0_5 td_n bg_lgr ff_mr fsz_1 br_03 ">Завершен</div>
            @else
                <button class="paa_0_5 td_n btn_dp_lp ff_mr fsz_1 br_03" onclick="rate_course({{$lesson->course_id}})">Завершить</button>
                {{-- <a href="{{route('complete_course', ['id_course'=>$lesson->course_id])}}" class="paa_0_5 td_n btn_dp_lp ff_mr fsz_1 br_03 ">Завершить</a> --}}
            @endif
        @endif
    </div>
</div>

<script>
    function rate_course(id_course){
        $("#id_course").val(id_course);
        $('#background_modal').css('display', 'flex');
    }
</script>

@endsection