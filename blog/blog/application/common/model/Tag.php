<?php
namespace app\common\model;
use think\Model;
class Tag extends Model
{
	protected $pk = 'tag_id';
    protected $table = 'blog_tag';
    public function store($data)
    {
		//执行验证
		//执行添加
		$result = $this->validate(true)->save($data,$data['tag_id']);
		if(false === $result){
			// 验证失败 输出错误信息
			return ['valid'=>0,'msg'=>$this->getError()];
			//dump($this->getError());
		}else{
			return ['valid'=>1,'msg'=>'操作成功'];
		} 	
    }

}
?>