package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by james on 2018/6/28.
 */
@Component
public class UserDao {
    @Autowired
    BaseDao baseDao;
    public int total = 0;
    List<User> childMenu=new ArrayList<User>();
    List<User> childMenu1=new ArrayList<User>();

    //登录系统
    public User login(String mobile, String pwd){
        final String sql ="select * from t_user where mobile = ? and pwd = ?";
        List<User> emps = baseDao.query(sql,User.class,new Object[]{mobile,pwd});
        if(emps.size()>0){
            return emps.get(0);
        }else {
            return null;
        }

    }

    //获取微信登录人员信息
    public User login(String openId){
        final String sql = "select a.*,b.name as rolename from t_user a left join t_role b on a.roleid=b.id where a.openid='"+openId+"'";
        List<User> emps = baseDao.query(sql,User.class,new Object[]{});
        if(emps.size()>0){
            return emps.get(0);
        }else {
            return null;
        }
    }

    //获取下级销售情况
    public List<User> getDownUserBySail(int userid){
        String sql = "select a.*,(select sum(buynum) as sailnum from t_user_goods where userid=a.id " +
                "and flag in ('2','3')) from t_user a where a.pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }

    //获取下级列表
    public List<User> getDownUser(int userid){
        String sql = "select a.*,b.name as rolename from t_user a left join t_role b on a.roleid=b.id where a.pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }

    //获取某个角色的下级列表
    public List<User> getDownUserRole(int userid,int roleid){
        String sql = "select a.*,(select count(*) from t_user where pid=a.id) as xjnum from t_user a " +
                "where a.pid=? and a.roleid=?";
        return baseDao.query(sql,User.class,new Object[]{userid,roleid});
    }


    //获取所有用户列表
    public List<User> getAllUsers(){
        String sql = "select * from t_user";

        return baseDao.query(sql,User.class,new Object[]{});
    }


    //查询某个用户是否购买过商品
    public int isBuyExist(int userid){
        String sql = "select count(*) from t_user_goods where userid=? and flag in('2','3')";

        return baseDao.queryForInt(sql,new Object[]{userid});
    }



    //获取所有购买商品用户列表
    public List<User> getAllBuyUsers(){
        String sql = "select * from t_user where id in(select distinct userid from t_user_goods where flag='2' or flag='3')";

        return baseDao.query(sql,User.class,new Object[]{});
    }

    //获取某个用户的直属下级列表
    public List<User> getDownUsers(int userid){
        String sql = "select * from t_user where pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }

    public List<User> getDownBuyUsers(int userid){
        String sql = "SELECT a.*,c.name as rolename FROM t_user a LEFT JOIN t_user_goods b ON a.id = b.userid " +
                "left join t_role c on a.roleid=c.id WHERE b.flag IN ('2','3') and a.pid=? GROUP BY a.id";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }

    //获取某个用户的直属下级某个状态的列表
    public List<User> getDownUsersByFlag(int userid,String flag){
        String sql = "select a.*,b.name as rolename,c.mobile as pmobile,c.name as pname from t_user a " +
                "left join t_role b on a.roleid=b.id left join t_user c on a.pid=c.id where a.pid=? and a.flag=?";
        return baseDao.query(sql,User.class,new Object[]{userid,flag});
    }

    //获取上级信息
    public User getUpUser(int userid){
        String sql = "select a.* from t_user a where a.id=(select b.pid from t_user b where b.id=?)";
        List<User> us =  baseDao.query(sql,User.class,new Object[]{userid});
        if(us.size()>0){
            return us.get(0);
        }else{
            return null;
        }
    }

    //获取某个用户下所有直属子用户的个数
    public int getXjnum(int userid){
        String sql = "select IFNULL(count(*),0) as xjnum from t_user where pid=?";
        return baseDao.queryForInt(sql,new Object[]{userid});

    }

    //获取某个用户下所有子用户的个数
    public int getAllXjnum(int userid){
        List<User> users = getDownUsers(userid);
        for(User user:users){
            int id = user.getId();
            total = total + getXjnum(id);
            getAllXjnum(id);
        }
        return total;
    }


    //获取某个用户所有的子用户，可用
    public List<User> treeMenuList( List<User> menuList, int pid){
        for(User mu: menuList){
            //遍历出父id等于参数的id，add进子节点集合
            if(Integer.valueOf(mu.getPid())==pid){
                //递归遍历下一级
                treeMenuList(menuList,Integer.valueOf(mu.getId()));
                childMenu.add(mu);
            }
        }
        return childMenu;
    }


    //获取某个用户所有购买商品的子用户
    public List<User> treeMenuList1( List<User> menuList, int pid){
        for(User mu: menuList){
            //遍历出父id等于参数的id，add进子节点集合
            if(Integer.valueOf(mu.getPid())==pid){
                //递归遍历下一级
                if(isBuyExist(mu.getId())>0) {

                    childMenu1.add(mu);
                }
                treeMenuList1(menuList, Integer.valueOf(mu.getId()));
            }
        }
        return childMenu1;
    }



    //获取某个用户下所有进货子用户的个数
    public int getAllBuyXjnum(int userid){
        List<User> users = getDownBuyUsers(userid);
        for(User user:users){
            int id = user.getId();
            total = total + getXjnum(id);
            getAllXjnum(id);
        }

        return total;

    }


    //获取某个用户最顶级用户信息
    public User getTopUser(int userid){
        User user = getUserById(userid);
        if(user.getPid()==0){
            return user;
        }else{
            return getTopUser(user.getId());
        }
    }



    public List<User> result = new ArrayList<>();
    //获取某个用户下所有子用户,不限于直属是所有层级
    public List<User> getAllXjs(int userid){

        List<User> users = getDownUser(userid);
        for(User user:users){
            int id = user.getId();
            result.add(user);
            getAllXjs(id);
        }

        return result;

    }



    public List<User> buyresult = new ArrayList<>();
    //获取某个用户下所有进货子用户,不限于直属是所有层级
    public List<User> getAllBuyXjs(int userid){

        List<User> users = getDownBuyUsers(userid);
        for(User user:users){
            int id = user.getId();
            buyresult.add(user);
            getAllBuyXjs(id);
        }

        return buyresult;

    }

    //获取某个用户的所有子用户
    public List<User> getAllUsersByUserid(int userid){
        String sql = "SELECT id,NAME,roleid,rolename FROM (\n" +
                "              SELECT t1.id,t1.name,t1.pid,t1.rolename,t1.roleid,\n" +
                "              IF(FIND_IN_SET(pid, @pids) > 0, @pids := CONCAT(@pids, ',', id), 0) AS ischild\n" +
                "              FROM (\n" +
                "                   SELECT t.id,t.pid,t.name,t.roleid,b.name AS rolename FROM t_user t LEFT JOIN t_role b ON t.roleid=b.id WHERE t.flag = '0' ORDER BY id\n" +
                "                  ) t1,\n" +
                "                  (SELECT @pids := ?) t2\n" +
                "             ) t3 WHERE ischild != 0";

        return baseDao.query(sql,User.class,new Object[]{userid});
    }



    //获取某个用户的所有子用户个数
    public int getAllUsersNumByUserid(int userid){
        String sql = "SELECT COUNT(*) FROM (\n" +
                "              SELECT t1.id,\n" +
                "              IF(FIND_IN_SET(pid, @pids) > 0, @pids := CONCAT(@pids, ',', id), 0) AS ischild\n" +
                "              FROM (\n" +
                "                   SELECT id,pid FROM t_user  WHERE flag = '0' ORDER BY id\n" +
                "                  ) t1,\n" +
                "                  (SELECT @pids := ?) t2\n" +
                "             ) t3 WHERE ischild != 0";

        return baseDao.queryForInt(sql,new Object[]{userid});
    }



    //获取某个用户的所有购买货物的子用户
    public List<User> getAllBuyUsersByUserid(int userid){
        String sql = "SELECT id,NAME,roleid,rolename FROM (\n" +
                "              SELECT t1.id,t1.name,t1.pid,t1.rolename,t1.roleid,\n" +
                "              IF(FIND_IN_SET(pid, @pids) > 0, @pids := CONCAT(@pids, ',', id), 0) AS ischild\n" +
                "              FROM (\n" +
                "                   SELECT t.id,t.pid,t.name,t.roleid,b.name AS rolename FROM t_user t LEFT JOIN t_role b ON t.roleid=b.id WHERE t.flag = '0' \n" +
                "                  ) t1,\n" +
                "                  (SELECT @pids := ?) t2\n" +
                "             ) t3 WHERE ischild != 0 AND id IN (SELECT DISTINCT(userid) FROM t_user_goods WHERE flag IN ('2','3'))";

        return baseDao.query(sql,User.class,new Object[]{userid});
    }



    //获取某个用户的所有购买货物的子用户个数
    public int getAllBuyUsersNumByUserid(int userid){
        String sql = "SELECT COUNT(*) FROM (\n" +
                "              SELECT t1.id,\n" +
                "              IF(FIND_IN_SET(pid, @pids) > 0, @pids := CONCAT(@pids, ',', id), 0) AS ischild\n" +
                "              FROM (\n" +
                "                   SELECT id,pid FROM t_user  WHERE flag = '0' \n" +
                "                  ) t1,\n" +
                "                  (SELECT @pids := ?) t2\n" +
                "             ) t3 WHERE ischild != 0 AND id IN (SELECT DISTINCT(userid) FROM t_user_goods WHERE flag IN ('2','3'))";

        return baseDao.queryForInt(sql,new Object[]{userid});
    }


    public int isExist(String mobile){
        String sql = "select * from t_user where mobile=?";
        List<User> us = baseDao.query(sql,User.class,new Object[]{mobile});
        if(us.size()>0){
            return 1;
        }else {
            return 0;
        }
    }



    public User getUserById(int id){
        String sql = "select a.*,b.name as rolename from t_user a left join t_role b on a.roleid=b.id where a.id=?";
        List<User> us = baseDao.query(sql,User.class,new Object[]{id});
        if(us.size()>0){
            return us.get(0);
        }else {
            return null;
        }
    }


    public int insUser(User user){

        String sql = "insert into t_user(name,roleid,pid,mobile,chatno,sex,pwd,birthday,idcard,area,cdate,flag, openid,headpath,money) " +
                "values(:name,:roleid,:pid,:mobile,:chatno,:sex,:pwd,:birthday,:idcard,:area,now(),'0',:openid, :headpath,0)";
        return baseDao.insert(sql,user);
    }

    /**
     * 修改用户基础信息
     * @param user 用户信息
     * @return 更改数量
     */
    public int updUser(User user){
        String sql = "UPDATE t_user SET openid=:openid, headpath=:headpath WHERE mobile=:mobile";
        return baseDao.update(sql,user);
    }

    public int updUser2(User user){
        String sql = "UPDATE t_user SET headpath=:headpath WHERE mobile=:mobile";
        return baseDao.update(sql,user);
    }

    public double getShouru(int userid,String flag){
        String sql = "select IFNULL(sum(totalp),0) from t_user_income where userid=? ";
        if(flag!=null && !flag.equals("")){
            sql = sql + " and flag='"+flag+"'";
        }
        return baseDao.queryForObject(sql,Double.class,new Object[]{userid});
    }



    public double getByShouru(int userid,String yearm){
        String sql = "select IFNULL(sum(totalp),0) from t_user_income where userid=? and yearm=?";
        return baseDao.queryForObject(sql,Double.class,new Object[]{userid,yearm});
    }

    //获取邀请人数(直推人数)
    public List<User> inviteUsers(Integer userId){
        String sql = "SELECT a.* FROM t_user a where a.pid = ?";
        List<User> us =  baseDao.query(sql,User.class,new Object[]{userId});
        return us;
    }

    //根据传入用户id获取全部用户信息（团人数）
    public List<User> inviteAllUsers(Integer userId){
        List<User> users = new ArrayList<>();
        for(User user : this.inviteUsers(userId)){
            users.add(user);
            List<User> tempList = this.inviteUsers(user.getId());
            users.addAll(tempList);
        }
        return users;
    }
}