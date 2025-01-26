<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use App\Models\Course;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
class LessonController extends Controller
{
    //
    public function images_lesson(){
        // $all_lesson_images = Storage::disk('images')->files('lessons');
        // dump(($all_lesson_images));
        // foreach($all_lesson_images as $img=>$i){
        //     dump($img);
        //     dump($i);

        // }
        return view('author/images_lesson');
    }
    public function add_to_dir(Request $request){
        // dd(public_path().'/img/lessons'.$request->file('img')->getClientOriginalName());
        $data = ['img'=>$request->img];
        // dd($data);
        $rules = ['img'=>'required|mimes:jpeg,jpg,png'];
        // dd($rules);
        $mess = [
            'img.request'=>'Выберите изображение', 
            'img.mimes'=>'Тип файла должен быть изображением!'
        ];
        $validate = Validator::make($data, $rules, $mess);
        // dd($validate);
        if($validate->fails()){
            return view('author/images_lesson')
            ->withErrors($validate);
        }else{
            $image = $request->file('img')->getClientOriginalName();
            $upload = $request->file('img')->move(public_path() . "/img/lessons", $image);
            if($upload){
                return redirect('/author/courses')->withErrors(['success'=>'Успешное добавление изображения в директорию!']);
            }
            else{
                return back()->withErrors(['unupload'=>'Не удалось загрузить изображение']);
            }
        }
    }
    public function create_lesson(Request $request){
        $array_data = [];
        $id = $request->id_course;
        $texts = $request->request;
        $imgs = $request->files;
        $title = $request->title;
        $text_task = $request->text_task;
        $time_task = $request->time_task;
        // dd($request);
        foreach($texts as $text){
            if(gettype($text) == 'array'){
                foreach($text as $key=>$value){
                    $array_data[$key] =["txt"=> $value];
                }
            }            
        }
        foreach($imgs as $img){
            if(gettype($img) == 'array'){
                foreach($img as $key=>$value){
                    // dump($value);
                    $array_data[$key] = ["img"=>$value->getClientOriginalName()];
                }
            }
        }
        ksort($array_data);
        $array_data = json_encode($array_data);
        $create = Lesson::insert([
            'title'=>$title,
            'course_id'=>$id,
            'content'=>($array_data), 
            'task'=>$request->text_task,
            'deadline'=>$request->time_task
        ]);
        if($create){
            return redirect('author_more_info_course/'.$id)->withErrors(['success'=>'Урок создан!']);
        }
        else{
            return redirect('author_more_info_course/'.$id)->withErrors(['error'=>'Не удалось создать урок!']);
        }
    }

    public function remove_lesson($id_lesson, $id_course){
        $remove = Lesson::where('id', '=', $id_lesson)->delete();
        if($remove){
            return redirect('author_more_info_course/'.$id_course)->withErrors(['success'=>'Урок удален!']);
        }
        else{
            return redirect('author_more_info_course/'.$id_course)->withErrors(['success'=>'Не удалось удалить урок!']);
        }
    }

    public function one_lesson($id){
        $one_lesson = Lesson::select('lessons.id', 'lessons.title', 'courses.title as course', 'content', 'task', 'deadline')->join('courses', 'courses.id', '=', 'lessons.course_id')->where('lessons.id', '=', $id)->get()[0];
        $content = array( json_decode(($one_lesson->content)));
        $array_content = [];
        foreach($content as $key=>$value){
            foreach($value as $a=>$b){
                // dump($a);
                $array_content[$a] =get_object_vars($b);
            }
        }
        // dump($array_content);
        // dd($content);
        // dd($one_lesson);
// @extends('author.header')resources/views/author/one_lesson.blade.php
        
        return view('author/one_lesson',  ['lesson'=>$one_lesson, 'content'=>$array_content]);
        
    }

    public function one_lesson_student($id, $course){
        $completed = User::select('completed_courses')->where('id', '=', Auth::user()->id)->get()[0]->completed_courses;
        if($completed != null){
            $completed = json_decode($completed)->courses;
            $completed = in_array($course, $completed);
        }
        
        // dd($completed);
        $array_lessons = Lesson::select('id', 'title')->where('course_id','=', $course)->get();
        $array_id = [];
        $array_id_title = [];
        $next_id = null;
        $next_title = null;
        $before_id = null;
        $before_title = null;
        foreach($array_lessons as $value){
            array_push($array_id, intval($value->id));
            $array_id_title[$value->id] = $value->title;
        }
        $current_key = array_search($id, $array_id); 
        if($current_key < $array_lessons->count()-1){
            $next_id = $array_id[$current_key+1];
            $next_title = $array_id_title[$next_id];
        }
        if($current_key != 0){
            $before_id = $array_id[$current_key-1];
            $before_title = $array_id_title[$before_id];
        }
        
        
        // dd($before_id, $before_title);
        
        // $next = 
        // dd($next_id, $next_title);
        $one_lesson = Lesson::select('courses.id as course_id','lessons.id', 'lessons.title', 'courses.title as course', 'content', 'task')->join('courses', 'courses.id', '=', 'lessons.course_id')->where('lessons.id', '=', $id)->get()[0];
        $content = array( json_decode(($one_lesson->content)));
        $array_content = [];
        foreach($content as $key=>$value){
            foreach($value as $a=>$b){
                // dump($a);
                $array_content[$a] = get_object_vars($b);
            }
        }
            
        return view('student/one_lesson',  ['lesson'=>$one_lesson, 'content'=>$array_content, 'next_id'=>$next_id, 'next_title'=>$next_title, 'before_id'=>$before_id, 'before_title'=>$before_title, 'completed'=>$completed]);
    }

    public function hworks(){
        $lessons = DB::table('lessons')->select('courses.id', 'courses.title', DB::raw('COUNT(task) as task'))->join('courses', 'courses.id', '=', 'lessons.course_id')->where('task', '!=','')->groupBy('courses.id')->get();
        return view('author/hworks', ['lessons'=>$lessons]);
    }

    public function more_hwork($id){
        $hwork = DB::table('lessons')->select('courses.id', 'courses.title', 'lessons.task')->join('courses', 'courses.id', '=', 'lessons.course_id')->where('courses.id', '=', $id)->where('task', '!=', " ")->get();
        return view('author/more_hwork', ['hwork'=>$hwork]);
    }

    public function uploads($id){
        $course = Course::select('title')->where('id', '=', $id)->get();
        // $course = DB::table('lessons')->select('courses.title')->join('courses', 'courses.id', '=', 'lessons.course_id')->where('lessons.id', '=', $id)->limit(1)->get();
        // dd($course, $id);
        $uploads = DB::table('uploads')->select('*', 'users.name as user_name','uploads.id as id_u')->where('lesson_id', '=', $id)->join('users', 'users.id', '=', 'uploads.user_id')->get();
        $count = DB::table('uploads')->where('lesson_id', '=', $id)->count();
        return view('author/uploads', ['uploads'=>$uploads, 'course'=>$course, 'count'=>$count]);
    }

    public function set_mark(Request $request){
        if(strlen(trim(strip_tags($request->mark))) > 0 ){
            $update = DB::table('uploads')->where('uploads.id', '=', $request->id_upload)->update(['mark'=>$request->mark, 'comments'=>$request->comments]);
            if($update){
                return back()->withErrors(['err'=>'Успешное сохранение оценки!']);
            }
            else{
                return back()->withErrors(['err'=>'Не удалось сохранить оценку!']);
            }
        }
        else{
            return back()->withErrors(['error'=>'Перед отправкой поставьте оценку!']);
        }
        dd($request);
    }
}
