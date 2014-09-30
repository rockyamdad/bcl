<?php


 class HomeController extends BaseController {

    public function __construct()
    {

        // parent::__construct();

       // if(Auth::check())
       // {
           // return Redirect::to('home/dashboard');
            $this->beforeFilter('csrf', array('on'=>'post'));
       // }
        //else{
           // return Redirect::to('home/login');
      //  }

    }
     public function getTestuser()
     {
         return 'okkk';
     }



	public function index()
	{
        echo 'sdfs';
	}
    public function  getRegister()
    {
        return 'well';
    }
    public function signup()
    {


            $user = new User;
            $user->email = Input::get('email');
            $user->password = Hash::make(Input::get('password'));
            $user->type = Input::get('type');
            $user->save();

            return Redirect::to('home/login')->with('message', 'Thanks for registering!');



    }
    public function login()
    {
        return View::make('Home.login');
    }
    /*public function login()
    {


            if (Auth::attempt(array('email'=>Input::get('email'), 'password'=>Input::get('password')))) {
                return Redirect::to('welcome')->with('message', 'You are now logged in!');
            } else {
                return Redirect::to('home')
                    ->with('message', 'Your username/password combination was incorrect')
                    ->withInput();
            }



       // return Redirect::to('welcome');
    }*/
    public function signin() {

        if (Auth::attempt(array('email'=>Input::get('email'), 'password'=>Input::get('password')))) {
            Session::put('user', Auth::user());
            return Redirect::to('home/dashboard')->with('message', 'You are now logged in!');
        } else {

            return Redirect::to('home/login')
                ->with('message', 'Your username/password combination was incorrect')
                ->withInput();
        }

    }
     public function dashboard() {


         return View::make('nerds.welcome');


     }
     public function test() {


         return "hello w";


     }


}