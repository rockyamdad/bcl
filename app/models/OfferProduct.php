<?php
/**
 * Created by PhpStorm.
 * User: rocky
 * Date: 5/20/14
 * Time: 2:30 PM
 */
class OfferProduct extends Eloquent{
   // protected $table = 'offers';
    public function offer()
    {
        return $this->belongsTo('Offer');
    }
    public function category()
    {
        return $this->belongsTo('ProductCategory');
    }


}