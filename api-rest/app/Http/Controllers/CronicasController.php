<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;


class CronicasController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $cronicas = \App\Models\Cronica::get();
        return response()->json([
            "msg" => "Success",
            "cronicas" => $cronicas->toArray()
        ],200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        //
        $cronica = new \App\Models\Cronica();
        $cronica->cronica = $request->cronica;
        $cronica->save();
        return response()->json([
            "msg" => "Success",
            "id" => $cronica->id
        ],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
        $cronica = \App\Models\Cronica::find($id);
        return response()->json([
            "msg" => "Success",
            "cronica" => $cronica
        ],200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
        $cronica = \App\Models\Cronica::find($id);

        $cronica->cronica = $request->cronica;
        $cronica->save();
        return response()->json([
            "msg" => "Success"
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
        $cronica = \App\Models\Cronica::find($id);
        $cronica->delete();
        return response()->json([
            "msg" => "Success"
        ],200);
    }

}
