<?php

/**
 * Created by PhpStorm.
 * User: rocky
 * Date: 4/24/14
 * Time: 12:34 PM
 */
class OfferController extends BaseController
{
    public function __construct()
    {
        $this->beforeFilter('admin');
    }
    public function getIndex()
    {
        $offers = Offer::where('status','=','send')
            ->where('status','=','draft','OR')
            ->get();

        return View::make('Offers.list')
            ->with('offers', $offers);
    }
    public function getArchivelist()
    {
        $offers = Offer::where('status','=','archive')
            ->get();

        return View::make('Offers.list')
            ->with('offers', $offers);
    }
    public function getDeletelist()
    {
        $offers = Offer::where('status','=','deleted')
            ->get();

        return View::make('Offers.list')
            ->with('offers', $offers);
    }

    public function getAdd()
    {
        $productList = Product::all();
        $clientList = ClientSupplier::all();
        return View::make('Offers.add')
            ->with('productDropDown', $productList)
            ->with('clientDropDown', $clientList);
    }

    public function postSavefiles()
    {
        $rules = array(
            'title' => 'required'
        );
        $validate = Validator::make(Input::all(),$rules);
        if($validate->fails())
        {
            return Redirect::to('offers/add')
                   ->with($validate);
        }
        else
        {
            $offers = new Offer;
            $offers->title = Input::get('title');

            $offers->description = Input::get('description');
            $offers->category_id = Input::get('category_id');
            $price = $offers->price = Input::get('price');
            $commission = $offers->commission = Input::get('commission');
            $quantity = $offers->quantity = Input::get('quantity');
            $offers -> line_total = ($price * $quantity) + (($price * $quantity) * $commission/100);
            $offers->created_by = Session::get('created_by');
            $offers->client_id = Input::get('client_id');
            $pi = Input::get('pi');
            $offers->pi = $pi;

            if($pi == 0){
                $filename = Input::file('attachment')->getClientOriginalExtension();
                $name = str_random(8).'.'.$filename;
                $destination = 'uploads/files/';
                $upload = Input::file('attachment')->move($destination,$name);
                $offers->attachment = $name;
                $offers->save();
                if($offers->save()){
                    $offer_id = $offers->id;
                    $html= View::make('Offers.pdf')
                            ->with('offerdata',$offers);
                    $filePath = "uploads/pdf" . DIRECTORY_SEPARATOR . $offer_id . ".pdf";

                    PDF::loadHTML($html)->setPaper('a4')->setWarnings(false)->save($filePath);
                }
            }

            else {

                if($offers->save()){
                    $offer_id = $offers->id;
                    $html= View::make('Offers.pdf')
                        ->with('offerdata',$offers);
                    $filePath = "uploads/pdf" . DIRECTORY_SEPARATOR . $offer_id . ".pdf";

                    PDF::loadHTML($html)->setPaper('a4')->setWarnings(false)->save($filePath);
                }

            }

            Session::flash('message', 'Offer has been Successfully Created.');
            return Redirect::to('offers/index/');
        }
    }


    public function getUpdate($id)
    {
        $productList = Product::all();
        $clientList = ClientSupplier::all();
        $offer = Offer::find($id);
        return View::make('Offers.update')
                ->with('offerdata',$offer)
                ->with('productDropDown', $productList)
                ->with('clientDropDown', $clientList);

    }
    public function putCheckUpdate($id)
    {

        $rules = array(
            'title' => 'required'
        );
        $validate = Validator::make(Input::all(),$rules);
        if($validate->fails())
        {
            return Redirect::to('offers/add')
                ->with($validate);
        }
        else
        {
            $offers = Offer::find($id);

            $offers->title = Input::get('title');
            $offers->description = Input::get('description');
            $offers->category_id = Input::get('category_id');
            $price = $offers->price = Input::get('price');
            $commission = $offers->commission = Input::get('commission');
            $quantity = $offers->quantity = Input::get('quantity');
            $offers -> line_total = ($price * $quantity) + (($price * $quantity) * $commission/100);
            $offers->created_by = Session::get('created_by');
            $offers->client_id = Input::get('client_id');
            $pi = Input::get('pi');
            $offers->pi = $pi;

            if($pi == 0){
                $filename = Input::file('attachment')->getClientOriginalExtension();
                $name = str_random(8).'.'.$filename;
                $destination = 'uploads/files/';
                $upload = Input::file('attachment')->move($destination,$name);
                $offers->attachment = $name;
                $offers->save();
                if($offers->save()){
                    $offer_id = $offers->id;
                    $html= View::make('Offers.pdf')
                        ->with('offerdata',$offers);
                    $filePath = "uploads/pdf" . DIRECTORY_SEPARATOR . $offer_id . ".pdf";

                    PDF::loadHTML($html)->setPaper('a4')->setWarnings(false)->save($filePath);
                }
            }

            else {

                if($offers->save()){
                    $offer_id = $offers->id;
                    $html= View::make('Offers.pdf')
                        ->with('offerdata',$offers);
                    $filePath = "uploads/pdf" . DIRECTORY_SEPARATOR . $offer_id . ".pdf";

                    PDF::loadHTML($html)->setPaper('a4')->setWarnings(false)->save($filePath);
                }

            }

            Session::flash('message', 'Offer has been Successfully Updated.');
            return Redirect::to('offers/index/');
        }

    }
    public function getDetails($id)
    {
        $offers = Offer::find($id);
        return View::make('Offers.details')
            ->with('offerDetails',$offers);
    }
    public function getDelete($id)
    {
        $status = 'deleted';
        $offers = Offer::find($id);
        $offers->status = $status;
        $offers->save();
        Session::flash('message', 'Offer has been Successfully Deleted.');
        return Redirect::to('offers/index');

    }
    public function getArchive($id)
    {
        $status = 'archive';
        $offers = Offer::find($id);
        $offers->status = $status;
        $offers->save();
        Session::flash('message', 'Offer has been Successfully Deleted.');
        return Redirect::to('offers/index');

    }


}