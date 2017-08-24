<?php
namespace app\admin\controller;
use think\Controller;
use app\common\model\Admin;
class Entry extends Common
{	
	public function index(){
		return $this->fetch();
	}
	/**
	 * 修改密码
	 */
	public function pass()
	{
		if(request()->isPost())
		{
			$res = (new Admin())->pass(input('post.'));
			if($res['valid'])
			{
				//清除session中的登录信息
				session(null);
				//执行成功
				$this->success($res['msg'],'admin/entry/index');exit;
			}else{
				$this->error($res['msg']);exit;
			}
		}
		return $this->fetch();
	}
	public function layout(){
		session(null);
		$this->success('退出成功','admin/entry/index');exit;
	}
}