<?php
namespace app\common\model;
use think\Loader;
use think\Model;
use think\Validate;
class Admin extends Model
{
	//主键
	protected $pk = 'admin_id';
	// 设置当前模型对应的完整数据表名称
    protected $table = 'blog_admin';
    /**
     *登陆
     */
	public function login($data){
		// halt($data);
		$validate = Loader::validate('Admin');

		if(!$validate->check($data)){
		//1.如果验证不通过
			return ['valid'=>0,'msg'=>$validate->getError()];
		    // dump($validate->getError());
		}
		// $a = md5($data['admin_password']);
		// 	print_r($a);
		//2.比对用户名和密码是否正确
		$userInfo = $this->where('admin_username',$data['admin_username'])->where('admin_password', md5($data['admin_password']))->find();
		// halt($userInfo);die();
		if(!$userInfo)
		{
			return ['valid'=>0 , 'msg' =>'用户名或密码不正确'];
		}
		//3.用户信息存到session中
		session('admin.admin_id',$userInfo['admin_id']);
		session('admin.admin_username',$userInfo['admin_username']);
		return ['valid'=>1 , 'msg'=>'登陆成功'];

	}

	/**
	 * 修改密码
	 * @param $data post数据
	 */
	public function pass($data)
	{
		//1.执行验证
		$validate = new Validate([
			'admin_password'  => 'require',
			'new_password' => 'require',
			'confirm_password' => 'require|confirm:new_password'
		],[
			'admin_password.require'=>'请输入原始密码',
			'new_password.require'=>'请输入新密码',
			'confirm_password.require'=>'请输入确认密码',
			'confirm_password.confirm'=>'确认密码跟新密码不一致',
		]);

		if (!$validate->check($data)) {
			return ['valid'=>0,'msg'=>$validate->getError()];
			//dump($validate->getError());
		}
		//2.原始是否正确
		$userInfo = $this->where('admin_id',session('admin.admin_id'))->where('admin_password',md5($data['admin_password']))->find();
		if(!$userInfo)
		{
			return ['valid'=>0,'msg'=>'原始密码不正确'];
		}
		//3.修改密码
		// save方法第二个参数为更新条件
		$res = $this->save([
			'admin_password'  =>md5($data['new_password']),
		],[$this->pk => session('admin.admin_id')]);
		if($res)
		{
			return ['valid'=>1,'msg'=>'密码修改成功'];
		}else{
			return ['valid'=>0,'msg'=>'修改密码失败'];
		}
	}
}