<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Admin;
use utils\Fos as fos;
// use houdunwang\crypt\Crypt;
class Login extends Controller
{
	public function login(){

		//  $a = db('admin')->find(1);
		// dump($a);
		// $foo = new Fos();
		// echo fos::authcode('68a1f010Wx0kj-PohV5GwuUW9m8RcbqDE0aTq6rqxIXHm-z46EIziA','DECODE');//解密 
		// $encrypted = \houdunwang\crypt\Crypt::encrypt('后盾网  人人做后盾',md5('houdunwang.com'));
		// echo $encrypted;
		if (request()->isPost()) {
			$re = (new Admin())->login(input('post.'));
			// print_r($re);
			if($re['valid'])
			{
				$this->success($re['msg'],'admin/Entry/index');exit;

			}else{
				//登陆失败
				$this->error($re['msg']);exit;

			}
		}
		return $this->fetch();
	}
	
}