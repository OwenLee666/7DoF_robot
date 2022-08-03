# 7DoF_robot
太空垃圾回收-7自由度机器人MATLAB仿真；内容涉及：
* 正运动学
* D-H 建模
* 逆运动学数值解法（只有位置约束的数值解法）
* RRT路径规划
* 广义三次多项式轨迹规划
* ...

---
## 配套内容
* 详解博客：https://blog.csdn.net/qq_37219127/article/details/126120084?spm=1001.2014.3001.5501
* 仿真视频：https://www.bilibili.com/video/BV1qS4y1x7PZ?spm_id_from=333.999.list.card_archive.click&vd_source=240689d86a403b4d5d22137f38d4d71e

## 目录结构
* 根目录：一些画图程序
* IK：逆运动学程序
* RRT：随机生成树路径规划算法程序
* trajectory_planing: 路径规划算法程序

按这个顺序，下层的程序是依赖于上层程序的

## 如何运行
将整个项目拷贝下来用matlab打开，然后运行任意一个MOV_XXX_XXX文件
* Mov_workspace：画出机械臂的工作空间
* IK/Mov_grab_spheres：测试逆运动学求解
* RRT/Mov_test_RRT：测试RRT路径规划
* **trajectory_planing/Mov_test_traj_plan**：演示轨迹规划，这是最终的文件，用到了项目的所有代码
