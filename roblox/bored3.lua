wait(2);
local cons=22.5;
local tim="T"..tick();
Instance.new("Model",workspace).Name=tim;
for level=1,180,cons do
for angle = 1, 360,cons do
local p = Instance.new('Part',game.Workspace[tim]);
p.Name=tim.."A"..angle.."L"..level;
p.BrickColor=BrickColor.new("Lime green");
p.Material="Neon";
p.Transparency=0.5;
p.CanCollide=false;
p.FormFactor="Custom";
Instance.new("BlockMesh",p).Scale=Vector3.new(1,0.1,1);
p.Size = Vector3.new(5,0.1,5);
p.Anchored = true
p.CFrame = CFrame.new(script.Parent.Parent.Character.Torso.Position.x, script.Parent.Parent.Character.Torso.Position.y, script.Parent.Parent.Character.Torso.Position.z)
        * CFrame.Angles(math.rad(180), math.rad(level), math.rad(angle))
        * CFrame.new(0,5,0);
end
end

while true do
for i=1,360,5 do
wait(0.01);
for level=1,180,cons do
for angle=1,360,cons do
game.Workspace[tim][tim.."A"..angle.."L"..level].CFrame = CFrame.new(game.Workspace[tim][tim.."A"..angle.."L"..level].Position.x, game.Workspace[tim][tim.."A"..angle.."L"..level].Position.y, game.Workspace[tim][tim.."A"..angle.."L"..level].Position.z)
* CFrame.Angles(math.rad(180),math.rad(level),math.rad(angle-i*2))
* CFrame.new(0,-5,0);
end
end
end
end
