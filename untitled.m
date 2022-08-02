create_DH_table();
set_variable_in_DH_table([2000 0 0 0 0 0 0]);
FK_calculate_joint_matrix_in_world();
draw_robot();

% grid on;
view(134,12);
axis([-1500,1500,-500,5000,-1500,1500]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;