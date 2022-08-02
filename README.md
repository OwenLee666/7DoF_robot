# 7DoF_robot
7自由度机械臂仿真-空间站抓取悬浮物体；内容涉及：
* 正运动学
* D-H 建模
* 逆运动学数值解法（只有位置约束的数值解法）
* RRT路径规划
* 广义三次多项式轨迹规划
* ...

---

## 如何运行
将整个项目拷贝下来用matlab打开，然后运行任意一个MOV_XXX_XXX文件
* Mov_workspace：画出机械臂的工作空间
* IK/Mov_grab_spheres：测试逆运动学求解
* RRT/Mov_test_RRT：测试RRT路径规划
* **trajectory_planing/Mov_test_traj_plan**：演示轨迹规划，这是最终的文件，用到了项目的所有代码
