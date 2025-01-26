@extends('author.header')

@section('title', $course[0]->title)
@section('content')
    <div class="pos_r">
        <div id="background_modal" class="bg_lgr w87 h40 pos_f z_i_2 df ali_c jc_c">
            <div class="w30 brc_lp paa_1 br_1 bg_w">
                <form action="{{route('set_mark')}}" method="POST" class="df fdr_c g1">
                    @csrf
                    <span class="fsz_1_2 ff_m c_dp">Оценивание </span>
                    <input id="id_upload" type="hidden" name="id_upload" value="">
                    <label for="mark" class="fsz_1 ff_mr df fdr_c c_dp">Оценка
                        <input required name="mark" class="ff_mr fsz_1 ou_n brc_lp paa_0_3 w6 br_03" type="number" min="2" max="5">
                    </label>
                    <label for="comments" class="fsz_1 ff_mr df fdr_c c_dp">Комментарий
                        <textarea class="ff_mr fsz_1 ou_n brc_lp paa_0_3 w1 br_03 mn_w_29 wmx_29" name="comments" id=""></textarea>
                    </label>
                    <div class="w29 df fdr_r g2">
                        <button class="w8 fsz_1 ff_mr paa_0_3 ou_n btn_dp_lp br_1" onclick="close_set_mark()">Закрыть</button>
                        <input class="w8 fsz_1 ff_mr paa_0_3 ou_n btn_dp_lp br_1" type="submit" value="Оценить">
                    </div>
                    
                </form>
            </div>
        </div>
        <span class="fsz_1 ff_ml c_lg">Выгружено: {{$count}}</span>
        <div class="df fdr_c g1 w78">
            <div class="df fdr_r g1 ff_mr fsz_1_2">
                <div class="w10">ID</div>
                <div class="w10">Студент</div>
                <div class="w10">Файл</div>
                <div class="w10">Оценка</div>
                <div class="w10">Коммент</div>
            </div>
            @foreach ($uploads as $les)
                <div class="df fdr_r g1 ff_mr fsz_1">
                    <div class="w10">{{$les->id_u}}</div>
                    <div class="w10">{{$les->user_name}}</div>
                    <div class="w10">{{$les->file}}</div>
                    <div class="w10">{{$les->mark}}</div>
                    <div class="w10">{{$les->comments}}</div>
                    @if(!isset($les->mark))
                        <div onclick="set_mark({{$les->id_u}})" class="w10">Оценить</div>
                    @endif
                </div>
                
            @endforeach
        </div>

    </div>


    <script>
        function set_mark(id){
            console.log(id);
            $("#id_upload").val(id);
            $("#background_modal").css('display', 'flex');
        }
        function close_set_mark(){
            $("#background_modal").css('display', 'none');
        }
    </script>
@endsection
{{--dd($uploads);--}}