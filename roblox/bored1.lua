wait(2);
local cons=30;
local tim="T"..1234567;
local radius=8;
local counter=-1;
local maxradius=15;
Instance.new("Model",workspace).Name=tim;
for level=1,180,cons do
for angle = 1, 360,cons do
local p = Instance.new('Part',game.Workspace[tim]);
p.Name=tim.."A"..angle.."L"..level;
p.BrickColor=BrickColor.new("Lime green");
p.Material="Neon";
p.Transparency=0;
p.CanCollide=false;
p.FormFactor="Custom";
Instance.new("CylinderMesh",p).Scale=Vector3.new(1,0.1,1);
p.Size = Vector3.new(2,0.1,2);
p.Anchored = true
p.CFrame = CFrame.new(script.Parent.Parent.Character.Torso.Position.x, script.Parent.Parent.Character.Torso.Position.y, script.Parent.Parent.Character.Torso.Position.z)
        * CFrame.Angles(math.rad(180), math.rad(level), math.rad(angle))
        * CFrame.new(0,2,0);
end
end

wait();
while true do
for i=1,360,5 do
wait(0.01);
radius=radius+counter;
if radius<0 then
counter=1;
else if radius>maxradius then
counter=-1;
end
for level=1,180,cons do
for angle=1,360,cons do
if game.Workspace[tim]:FindFirstChild(tim.."A"..angle.."L"..level) then
game.Workspace[tim][tim.."A"..angle.."L"..level].BrickColor=BrickColor.Random();
game.Workspace[tim][tim.."A"..angle.."L"..level].CFrame = CFrame.new(script.Parent.Parent.Character.Torso.Position.x, script.Parent.Parent.Character.Torso.Position.y, script.Parent.Parent.Character.Torso.Position.z)
* CFrame.Angles(math.rad(i),math.rad(level+i),math.rad(angle+i))
* CFrame.new(0,radius,0);

end
end
end
end
end
end
