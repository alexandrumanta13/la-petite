<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

require dirname(__DIR__) . "/class-phpass.php";

/** @var \Laravel\Lumen\Routing\Router $router */
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group(["prefix" => "v1"], function () use ($router) {
    // rute accesorii

    $router->get('accessories', function () use ($router) {
        $query = DB::table('accessories')->get();

        return response()->json($query);
    });

    // rute categorii

     $router->get('categories', function () use ($router) {
        $count = DB::table('categories')->count();
        $query = DB::table('categories')->get();

        return response()->json(['count' => $count, 'categories' => $query]);
    });

    $router->get('category/{slug}/', function ($slug) use ($router) {
        $query = DB::table('categories')->where('categories.slug', '=', $slug)->get();

        return response()->json(['category' => $query]);
    });


    // rute produse

    $router->get('products[/{page:[0-9*]}]', function ($page = 1) use ($router) {
        $count = DB::table('products')->count();
        $limit = 9;
        $jsonData = [
            'page' => $page ? $page : 1,
            'no_of_pages' => ceil($count / $limit),
            'no_of_productsper_page' => $limit,
            'no_of_productson_current_page' => null,
            'total_no_of_products' => $count,
            'products' => null,
        ];

        if ($page >= 1) {
            $offset = ($limit * $page) - $limit; // pg 1 = 30*1 - 30 = 0; pg 2 = 30*2 - 30 = 30; pg 3 = 30*3 - 30 = 60
            $query = DB::table('products')
                ->select(
                    'products.id', 
                    'products.product_name', 
                    'products.alias', 
                    'products.CategoryID', 
                    'products.description',
                    'products.ingredients')
                ->where('active', 1)
                ->limit($limit)
                ->offset($offset)
                ->orderBy('id', 'asc')
                ->get();
            for ($i = 0; $i < count($query); $i++) {
                $images = DB::table('product_images')
                          ->select('image_url')
                          ->where('ProductID', $query[$i]->id)
                          ->get();

                $categories = DB::table('product_categories')
                          ->select('categories.id', 'categories.category_name', 'categories.slug', 'categories.banner')
                          ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                          ->where('ProductID', $query[$i]->id)
                          ->get();


               
                $getInfo = DB::table('product_info')
                    ->select('quantities.quantity', 'quantities.um', 'product_info.price', 'quantities.portions')
                    ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                    ->where('ProductID', $query[$i]->id)->orderBy('product_info.price', 'asc')
                    ->get();

                $availableQuantities = DB::table('product_info')
                    ->select('quantities.quantity', 'quantities.um', 'quantities.portions')
                    ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                    ->where('ProductID', $query[$i]->id)->orderBy('quantities.quantity', 'asc')
                    ->distinct()
                    ->get();


                $query[$i]->images = $images;
                $query[$i]->categories = $categories;
                $query[$i]->availableQuantities = $availableQuantities;
                $query[$i]->information = $getInfo;

            }

            $jsonData["products"] = $query;
            $jsonData["no_of_productson_current_page"] = count($query);
        }
        return response()->json($jsonData);
    });


    $router->get('product/{slug}', function ($slug) use ($router) {
        if (!$slug) {
            return response()->json(['error' => 'No slug provided.']);
        }
        $query = DB::table('products')
            ->select('products.id', 'product_name', 'description', 'descriptionInfo', 'alias', 'ingredients')
            ->where('alias', '=', $slug)->limit(1)->get();

        $images = DB::table('product_images')
            ->select('image_url')
            ->where('ProductID', $query[0]->id)
            ->get();

        $categories = DB::table('product_categories')
                    ->select('categories.id', 'categories.category_name', 'categories.slug', 'categories.banner')
                    ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                    ->where('ProductID', $query[0]->id)
                    ->get();

        $getInfo = DB::table('product_info')
            ->select('quantities.id', 'quantities.quantity', 'quantities.um', 'product_info.price', 'quantities.portions')
            ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
            ->where('ProductID', $query[0]->id)->orderBy('product_info.price', 'asc')
            ->get();

        $availableQuantities = DB::table('product_info')
            ->select('quantities.id', 'quantities.quantity', 'quantities.um', 'quantities.portions')
            ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
            ->where('ProductID', $query[0]->id)->orderBy('quantities.quantity', 'asc')
            ->distinct()
            ->get();

        $query[0]->images = $images;
        $query[0]->categories = $categories;
        $query[0]->availableQuantities = $availableQuantities;
        $query[0]->information = $getInfo;

        return response()->json($query[0]);
    });


    $router->get('products/category/{slug}[/page/{page}]', function ($slug, $page = 1) use ($router) {
        if (!$slug) {
            return response()->json(['error' => 'No slug provided.']);
        }

        $count = DB::table('products')
            ->join('product_categories', 'product_categories.ProductID', '=', 'products.id')
            ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
            ->where('categories.slug', '=', $slug)
            ->where('products.active', 1)
            ->count();
        $limit = 9;
        $jsonData = [
            'page' => $page ? $page : 1,
            'banner' => null,
            'no_of_pages' => ceil($count / $limit),
            'no_of_productsper_page' => $limit,
            'no_of_productson_current_page' => null,
            'total_no_of_products' => $count,
            'products' => null,
        ];

        $jsonData["banner"] = DB::table('categories')->where('slug', $slug)->value('banner');

        if ($page >= 1) {
            $offset = ($limit * $page) - $limit; // pg 1 = 30*1 - 30 = 0; pg 2 = 30*2 - 30 = 30; pg 3 = 30*3 - 30 = 60
            $query = DB::table('products')
                ->select(
                    'products.id', 
                    'products.product_name', 
                    'products.alias', 
                    'products.CategoryID', 
                    'products.description',
                    'products.ingredients')
                ->join('product_categories', 'product_categories.ProductID', '=', 'products.id')
                ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                ->where('categories.slug', '=', $slug)
                ->where('products.active', 1)
                ->distinct()
                ->offset($offset)
                ->limit($limit)
                ->get();

            for ($i = 0; $i < count($query); $i++) {
                $images = DB::table('product_images')
                        ->select('image_url')
                        ->where('ProductID', $query[$i]->id)
                        ->get();

                $categories = DB::table('product_categories')
                        ->select('categories.id', 'categories.category_name', 'categories.slug', 'categories.banner')
                        ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                        ->where('ProductID', $query[$i]->id)
                        ->get();

                $getInfo = DB::table('product_info')
                        ->select('quantities.quantity', 'quantities.um', 'product_info.price', 'quantities.portions')
                        ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                        ->where('ProductID', $query[$i]->id)->orderBy('product_info.price', 'asc')
                        ->get();
    
                $availableQuantities = DB::table('product_info')
                        ->select('quantities.quantity', 'quantities.um', 'quantities.portions')
                        ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                        ->where('ProductID', $query[$i]->id)->orderBy('quantities.quantity', 'asc')
                        ->distinct()
                        ->get();
    
                $query[$i]->images = $images;
                $query[$i]->categories = $categories;
                $query[$i]->availableQuantities = $availableQuantities;
                $query[$i]->information = $getInfo;
    
            }
            $jsonData["products"] = $query;
            $jsonData["no_of_productson_current_page"] = count($query);
        }

        return response()->json($jsonData);
    });


    
        $router->get('recommended/category/{slug}', function ($slug) use ($router) {
            if (!$slug) {
                return response()->json(['error' => 'No slug provided.']);
            }
            $limit = 4;
            $query = DB::table('products')
                ->select(
                    'products.id', 
                    'products.product_name', 
                    'products.alias', 
                    'products.CategoryID', 
                    'products.description',
                    'products.ingredients')
                ->join('product_categories', 'product_categories.ProductID', '=', 'products.id')
                ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                ->where('categories.slug', '=', $slug)
                ->where('products.active', 1)
                
                ->limit($limit)
                ->orderByRaw('RAND()')
                ->get();

            for ($i = 0; $i < count($query); $i++) {
                $images = DB::table('product_images')
                        ->select('image_url')
                        ->where('ProductID', $query[$i]->id)
                        ->get();

                $categories = DB::table('product_categories')
                        ->select('categories.id', 'categories.category_name', 'categories.slug', 'categories.banner')
                        ->join('categories', 'categories.id', '=', 'product_categories.CategoryID')
                        ->where('ProductID', $query[$i]->id)
                        ->get();

                $getInfo = DB::table('product_info')
                        ->select('quantities.quantity', 'quantities.um', 'product_info.price', 'quantities.portions')
                        ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                        ->where('ProductID', $query[$i]->id)->orderBy('product_info.price', 'asc')
                        ->get();
    
                $availableQuantities = DB::table('product_info')
                        ->select('quantities.quantity', 'quantities.um', 'quantities.portions')
                        ->join('quantities', 'quantities.id', '=', 'product_info.QuantityID')
                        ->where('ProductID', $query[$i]->id)->orderBy('quantities.quantity', 'asc')
                        ->distinct()
                        ->get();
    
                $query[$i]->images = $images;
                $query[$i]->categories = $categories;
                $query[$i]->availableQuantities = $availableQuantities;
                $query[$i]->information = $getInfo;
                //$query = DB::table('products')->orderByRaw('RAND()')->get();
            }
    
            return response()->json(['products' => $query]);
        });




    // rute comenzi

    $router->post('order/add', function (Request $request) use ($router) {
        
        $data = $request->json()->all();
        $guid = uniqid('', true);
        
        $hasCompany = $request->json()->get('hasCompany');

        // order
        $order = $data; //reference, total, discount, date
        // customer
        $customer = $order[0]['customer']; // id, email, firstName, lastName, phone
        $shippingAddress = $customer['shippingAddress']; // address, county, town, lat, lng -> dependent on customer
        // products
        $products = $order[0]['products']; // id, name, quantity, price

        $deliverydate = $order[0]['deliverydate'];

        $interval = $order[0]['intervaldelivery'];

       
        if(isset($order[0]['accessories'])) {
            $accessories = $order[0]['accessories'];

        }

        $shippingAddressId = DB::table('orders_shipping_address')->insertGetId(
            [
                'address' => $shippingAddress['address'],
                'county' => $shippingAddress['county'],
                'town' => $shippingAddress['town'],
                
            ]
        );

        
        $customerId = DB::table('customers')->insertGetId(
            [
                'firstName' => $customer['firstName'],
                'lastName' => $customer['lastName'],
                'email' => $customer['email'],
                'phone' => $customer['phone'],
                'shippingAddressId' => $shippingAddressId,
            ]
        );
        

        // creaza comanda
        $orderId = DB::table('orders')->insertGetId(
            [
                'order_uuid' => $guid,
                'discount' => $order[0]['discount'],
                'total' => $order[0]['total'],
                'method' => $order[0]['method'],
                'notes' => $order[0]['notes'] ? $order[0]['notes'] : '',
                'customerId' => $customerId,
                'deliverydate' => $deliverydate,
                'intervaldelivery' => $interval,
            ]
        );

        if(isset($order[1]['address_id'])) {
            $updateOrder = DB::table('orders')->where('id', $orderId);
            $updateOrder->update(
                [
                    'user_id' => $order[1]['user_id'],
                    'address_id' => $order[1]['address_id'],
                ]
            );
        } elseif(isset($order[1]['user_id']) && !isset($order[1]['address_id'])) {
            $addressId = DB::table('address')->insertGetId(
                [
                    'phone' => $order[1]['phone'],
                    'address' => $order[1]['address'],
                    'county' => $order[1]['county'],
                    'town' => $order[1]['town'],
                    'user_id' => $order[1]['user_id'],
                ]
            );
            $updateOrder = DB::table('orders')->where('id', $orderId);
            $updateOrder->update(
                [
                    'user_id' => $order[1]['user_id'],
                    'address_id' => $addressId,
                ]
            );
        }
        if(isset($order[0]['accessories'])) {
            // adauga accesorile comenzii
            for ($i = 0; $i < count($accessories); $i++) {
                DB::table('orders_accessories')->insert(
                    [
                        'order_id' => $orderId,
                        'accessory_name' => $accessories[$i]['accessory_name'],
                        'price' => $accessories[$i]['price'],
                        'AccessoryID' => $accessories[$i]['id']
                    ]
                );
            }
        }
        

        // adauga produsele comenzii
        for ($i = 0; $i < count($products); $i++) {
            DB::table('product_orders')->insert(
                [
                    'order_id' => $orderId,
                    'product_name' => $products[$i]['product_name'],
                    'quantity' => $products[$i]['selectedQnt'],
                    'num' => $products[$i]['num'],
                    'price' => $products[$i]['selectedPrice'],
                    
                    'ProductID' => $products[$i]['id']
                ]
            );
        }

        return response()->json(['status' => 'success', 'message' => 'Comanda a fost procesata.', 'order_guid' => $guid]);
    });

    // rute user

    $router->post('signup', function (Request $request) {
        
        $name = $request->json()->get('name');
        $email = $request->json()->get('email');
        $provider = $request->json()->get('provider');
        $provider_id = $request->json()->get('provider_id');
        $provider_pic = $request->json()->get('provider_pic');
        $token = $request->json()->get('token');


        $user = DB::table('users')->where('provider_id', $provider_id);
        
        if ($user->exists()) {
            $user->update(
                [
                    'name' => $name,
                    'email' => $email,
                    'provider' => $provider,
                    'provider_pic' => $provider_pic,
                    'token' => $token,
                    'date_last_visit' => date('Y-m-d H:i:s')
                ]
            );
            $userData = 
            [
                'name' => $name,
                'email' => $email,
                'provider_pic' => $provider_pic,
                'token' => $token,
                'date_last_visit' => date('Y-m-d H:i:s')
            ];
            return response()->json(['success' => false, 'message' => 'Profilul a fost actualizat!', 'userData' => $userData]);
        } else {
            DB::table('users')->insert
            (
            [
                'name' => $name,
                'email' => $email,
                'provider' => $provider,
                'provider_id' => $provider_id,
                'provider_pic' => $provider_pic,
                'token' => $token,
                'access' => 0,
                'date_last_visit' => date('Y-m-d H:i:s'),
                'date_created' => date('Y-m-d H:i:s')
            ]
        );
            return response()->json(['success' => true, 'message' => 'Contul tau a fost inregistrat cu succes.']);
        }
    });


    // rute cupon
    $router->post('coupon/generate', function (Request $request) use ($router) {
        $email = $request->json()->get('email');
        $coupon = "SARBATORI10";
        $couponExists = DB::table('coupons')->where('coupon', $coupon)->where('email', $email)->where('used', 0);
        // $couponExists = DB::table('coupons')->where('email', $email)->exists();

        if ($couponExists->exists()) {
            return response()->json(['success' => false, 'message' => 'Exista deja un cupon activ.']);
        }

        $couponUsed = DB::table('coupons')->where('coupon', $coupon)->where('email', $email)->where('used', 1);

        if ($couponUsed->exists()) {
            return response()->json(['success' => false, 'message' => 'Ai utilizat deja acest cupon.']);
        }

        // $chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        // $coupon = "";
        // $coupon .= date("m");

        // $randomIndex = rand(0, 14);

        // for ($i = 0; $i < 15; $i++) {
        //     if ($i == $randomIndex) {
        //         $coupon .= date("d");
        //     }
        //     $coupon .= $chars[mt_rand(0, strlen($chars) - 1)];
        // }
        // $coupon .= date("y");
        
        $query = DB::table('coupons')->insert
            (
            [
                'coupon' => $coupon,
                'email' => $email,
            ]
        );

        return response()->json(['success' => true, 'message' => 'Cuponul a fost generat cu succes si asteapta sa fie folosit.', 'coupon' => $coupon]);
    });

    $router->post('coupon/check', function (Request $request) use ($router) {
        // $token = $request->header('X-Auth');
        // if (!$token) {
        //     return response()->json(['success' => false, 'message' => 'Trebuie sa fi autentificat pentru a putea utiliza codul.']);
        // }
        // $user = DB::table('users')->where('token', $token);
        // if (!$user->exists()) {
        //     return response()->json(['success' => false, 'message' => 'User invalid.']);
        // }

        $email = $request->json()->get('email');

        $couponCode = $request->json()->get('coupon');
        
        $coupon = DB::table('coupons')->where('coupon', $couponCode)->where('email', $email);
        


        if (!$coupon->exists()) {
            return response()->json(['success' => false, 'message' => 'Cupon sau adresa de email invalida']);
        }
        if ($coupon->value('used') == 1) {
            return response()->json(['success' => false, 'message' => 'Cuponul se poate folosi o singura data.']);
        }

        
        return response()->json(
            [
                'success' => true,
                'type' => $coupon->get()[0]->type,
                'percent' => $coupon->get()[0]->percent,
                'message' => 'Cuponul poate fi folosit.',
            ]
        );
    });

    $router->post('coupons', function (Request $request) use ($router) {
        // $token = $request->header('X-Auth');
        // if (!$token) {
        //     return response()->json(['success' => false, 'message' => 'Trebuie sa fi autentificat pentru a putea utiliza codul.']);
        // }
        // $user = DB::table('users')->where('token', $token);
        // if (!$user->exists()) {
        //     return response()->json(['success' => false, 'message' => 'User invalid.']);
        // }

        $email = $request->json()->get('email');

       
        
        $coupons = DB::table('coupons')->select()->where('email', $email)->get();


        
        return response()->json(
            [
                'success' => true,
                'coupons' => $coupons
            ]
        );
    });

    $router->post('coupon/use', function (Request $request) use ($router) {
        $email = $request->json()->get('email');
        $couponCode = $request->json()->get('coupon');
        $coupon = DB::table('coupons')->where('coupon', $couponCode)->where('email', $email);
        


        if (!$coupon->exists()) {
            return response()->json(['success' => false, 'message' => 'Cupon sau adresa de email invalida']);
        }
        if ($coupon->value('used') == 1) {
            return response()->json(['success' => false, 'message' => 'Cuponul se poate folosi o singura data.']);
        }

        $coupon->update(['used' => 1]);
        return response()->json(
            [
                'success' => true,
                'type' => $coupon->get()[0]->type,
                'percent' => $coupon->get()[0]->percent,
                'message' => 'Cuponul a fost folosit.',
            ]
        );
    });

    // rute utilizatori

    $router->post('login', function (Request $request) use ($router) {

        $email = $request->json()->get('email');
   
        $password = $request->json()->get('password');
        $user = DB::table('users')->where('email', $email)->first();
        $emailCheck = DB::table('users')->where('email', $email)->exists();
            if(!$emailCheck) {
                return response()->json(['success' => false, 'message' => 'Email-ul nu exista in baza de date']);
            } else {
                $updateUser = DB::table('users')
                ->where('token', $user->token);
                $updateUser->update(['date_last_visit' => date('Y-m-d H:i:s')]);
            }
        
        
       

        if (password_verify($password, $user->password)) {
            return response()->json(['success' => true, 'message' => 'Ai fost autentificat cu succes.', 'user' => $user])->header('X-Auth', $user->token);
        } else {
            return response()->json(['success' => false, 'message' => 'Parola este gresita']);
        }
        

    });

    $router->post('register', function (Request $request) {
        $lastName = $request->json()->get('lastName');
        $firstName = $request->json()->get('firstName');
        $email = $request->json()->get('email');
        $phone = $request->json()->get('phone');
        $password = password_hash($request->json()->get('password'), PASSWORD_DEFAULT);

        $token = openssl_random_pseudo_bytes(16);
        $token = bin2hex($token);

     
            $emailCheck = DB::table('users')->where('email', $email)->exists();
            if($emailCheck) {
                return response()->json(['success' => false, 'message' => 'Acest email este deja inregistrat!.']);
            } else {
                $userId = DB::table('users')->insertGetId(
                    [
                        'name' => $firstName,
                        'last_name' => $lastName,
                        'email' => $email,
                        'password' => $password,
                        'access' => 0,
                        'token' => $token,
                        'date_created' => date('Y-m-d H:i:s'),
                        'date_last_visit' => date('Y-m-d H:i:s')
                    ]
                );
        
                $user = DB::table('users')->where(['id' => $userId])->first();
        
                return response()->json(['success' => true, 'message' => 'Contul tau a fost inregistrat cu succes.', 'user' => $user]);
            }
           
        

        
    });

    $router->post('recover', function (Request $request) {

        $token = openssl_random_pseudo_bytes(16);
        $token = bin2hex($token);
        
        $email = $request->json()->get('email');

        $emailCheck = DB::table('users')->where('email', $email)->exists();
        if($emailCheck) {
            $updateUser = DB::table('users')->where('email', $email);
            $updateUser->update(['token' => $token]);
            $user = DB::table('users')->where('email', $email)->first();

            return response()->json(['success' => true, 'message' => 'Am trimis pe email pasii de recuperare a parolei!.', 'user' => $user]);
        } else {
            return response()->json(['success' => false, 'message' => 'Acest email nu exista in baza de date']);
        }

    });

    $router->post('changePassword', function (Request $request) {

        $token = openssl_random_pseudo_bytes(16);
        $token = bin2hex($token);

        $userCheck = DB::table('users')->where(['token' => $request->json()->get('token')])->exists();
        
        
    
        if($userCheck) {
            $updateUser = DB::table('users')->where(['token' => $request->json()->get('token')]);
            $password = password_hash($request->json()->get('password'), PASSWORD_DEFAULT);
            
            $updateUser->update(
                [
                    'token' => $token,
                    'password' => $password,
                    'date_last_visit' => date('Y-m-d H:i:s')
                ]
            );
           

            return response()->json(['success' => true, 'message' => 'Parola a fost schimbata cu succes']);
        } else {
            return response()->json(['success' => false, 'message' => 'Sesiunea a expirat, va rugam sa incercati din nou']);
        }

    });


    $router->post('user/update', function (Request $request) {
        $userCheck = DB::table('users')->where(['id' => $request->json()->get('id')])->first();
        $user = DB::table('users')->where(['id' => $request->json()->get('id')]);
        
        
        $lastName = $request->json()->get('lastName');
        $firstName = $request->json()->get('firstName');
        $email = $request->json()->get('email');
        $password = $request->json()->get('password');
        
        

        if ($email != $userCheck->email) {
            $emailCheck = DB::table('users')->where('email', $email)->exists();
            if($emailCheck) {
                return response()->json(['success' => false, 'message' => 'Acest email este deja inregistrat!.']);
            } else {
                $user->update(
                    [
                    'email' => $email,
                    ]
                );
            }
           
        }
        if($password) {
            
            $password = password_hash($request->json()->get('password'), PASSWORD_DEFAULT);
            $user->update(
                [
                'password' => $password,
                ]
            );
        }

        $user->update(
            [
                'name' => $firstName,
                'last_name' => $lastName,
            ]
        );
        $userCheck = DB::table('users')->where(['id' => $request->json()->get('id')])->first();

        return response()->json(['success' => true, 'message' => 'Datele tale au fost actualizate cu success!', 'user' => $userCheck]);
    });

    $router->get('customer/orders/{customerID}', function ($customerID) use ($router) {

        $orderBaseQuery = DB::table('orders')
            ->orderBy('date', 'desc')
            ->where('user_id', $customerID)
            ->get();

        for ($i = 0; $i < count($orderBaseQuery); $i++) {
            $userBaseQuery = DB::table('users')
                ->where('id', $customerID)
                ->get();

            $orderedProducts = DB::table('product_orders')
                ->select()
                ->where('order_id', $orderBaseQuery[$i]->id)
                ->get();

            $orderedAccessories = DB::table('orders_accessories')
                ->select()
                ->where('order_id', $orderBaseQuery[$i]->id)
                ->get();
           
           
               

            $shippingAddress = DB::table('address')
                ->select()
                ->where('user_id', $userBaseQuery[0]->id)
                ->get();
            $userBaseQuery[0]->shippingAddress = $shippingAddress;

            $orderBaseQuery[$i]->customer = $userBaseQuery[0];
            $orderBaseQuery[$i]->products = $orderedProducts;
            $orderBaseQuery[$i]->accessories = $orderedAccessories;
            
            unset($orderBaseQuery[$i]->customerId);
            unset($orderBaseQuery[$i]->shippingDetailId);
            unset($orderBaseQuery[$i]->paymentId);
        }

        $jsonData["orders"] = $orderBaseQuery;
    

        return response()->json($jsonData);

    });

    $router->get('order/{orderId}', function ($orderId) use ($router) {
        if (!$orderId) {
            return response()->json(['error' => 'No order id provided.']);
        }

        $orderBaseQuery = DB::table('orders')
            ->where('order_uuid', $orderId)
            ->get();

        $userBaseQuery = DB::table('users')
            ->where('id', $orderBaseQuery[0]->user_id)
            ->get();

        $orderedProducts = DB::table('product_orders')
            ->select()
            ->join('products', 'products.id', '=', 'product_orders.ProductID')
            ->where('product_orders.order_id', $orderBaseQuery[0]->id)
            ->get();


        $orderedAccessories = DB::table('orders_accessories')
            ->select()
            ->where('order_id', $orderBaseQuery[0]->id)
            ->get();


        $orderJson = DB::table('orders')
            ->select()
            ->where('order_uuid', '=', $orderId)
            ->get();

        $userJson = DB::table('users')
            ->select()
            ->where('id', $orderBaseQuery[0]->user_id)
            ->get();

    
        $shippingAddress = DB::table('address')
            ->select()
            ->where('id', $orderBaseQuery[0]->address_id)
            ->get();
        
        $userJson[0]->shippingAddress = $shippingAddress;

        
        for ($i = 0; $i < count($orderedProducts); $i++) {
            $productImages = DB::table('product_images')
            ->select()
            ->where('id', $orderedProducts[$i]->ProductID)
            ->get();
            $orderedProducts[$i]->images = $productImages;
        
        }
        
        $orderJson[0]->customer = $userJson[0];
        $orderJson[0]->products = $orderedProducts;
        
        $orderJson[0]->accessories = $orderedAccessories;
        
        
        

        return response()->json($orderJson);

    });


    // rute adrese

    

    $router->get('addresses/{user}', function ($user) use ($router) {
        if (!$user) {
            return response()->json(['error' => 'No user provided.']);
        }
        
        $query = DB::table('address')->where('user_id', $user)->get();
        return response()->json(["data" => $query]);
    });


});
