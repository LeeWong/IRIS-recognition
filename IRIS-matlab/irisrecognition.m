function [out]=irisrecognition()
clc;
chos=0;
possibility=4;
scales = 1;
messaggio='����� ����������! ��� ����������� ������ ������� � ������� ��� �����������������.';
while chos~=possibility,
    chos=menu('����� ����������! ��� ����������� ������ ������� � ������� ��� �����������������.','���� � �������','�����������','�����');
    if chos==1,
        clc;
        noes = inputdlg({'������� �����' '������� ������'})
        title='������� � �������';
            id = noes{1};
            parol = (str2num(noes{2}));
            userdb=[id,'.dat'];
            if (exist(userdb)==0)
               warndlg('������������ �� ����������')
               pause(1);
               allHandle = allchild(0);
               allTag = get(allHandle, 'Tag');
               isWarndlg = strncmp(allTag, 'Msgbox_', 7);
               delete(allHandle(isWarndlg));
               break; 
            end
                load(userdb,'pass_id','pass','-mat');
            
                   
                    if isempty(parol)
                     warndlg('��������� ������ ������')
                     pause(1);
                     allHandle = allchild(0);
                     allTag = get(allHandle, 'Tag');
                     isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                     delete(allHandle(isWarndlg));
                     break;
                    elseif (parol~=pass)
                    warndlg('������������ ������')
                    cam=webcam(1);
                    pause(1);
                    imwrite(snapshot(cam),'lol.png');
                    delete(cam);
                    namefile='\lol.png';
                    pathname=cd;
                    [img,map]=imread(strcat(pathname,namefile));
                    warndlg('����!')
                    pause(1)
                    allHandle = allchild(0);
                    allTag = get(allHandle, 'Tag');
                    isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                    delete(allHandle(isWarndlg));
                    break;

               else
                    warndlg('������ ������!')
                    pause(1)
                    allHandle = allchild(0);
                    allTag = get(allHandle, 'Tag');
                    isWarndlg = strncmp(allTag, 'Msgbox_', 7);
                    delete(allHandle(isWarndlg));
                    chos=1;
               end


        


%--------------------------------------------------------------------
clc;
chos=0;
possibility=7;
scales = 1;


messaggio='������� ID ������������. ID - ����������� ������������� �����. � ������ ID �������� ���������� � ���������� ���������� ������� ������������.';



while chos~=possibility,
    chos=menu('������� �������������� �� �������','������� ���������� �����','������� ����������','�������� ����������� � ���� ������','����������� ������������ �� �������','���������� � ���� ������','������� ���� ������','�����');
    %----------------
    
    


    if chos==1,
        clc;
        
        cam=webcam(1);
        preview(cam);
        
        pause;
        
        imwrite(rgb2gray(snapshot(cam)), 'your.png');
        
        delete(cam);
        close all;

        namefile='\your.png';
        pathname=cd;
        [img,map]=imread(strcat(pathname,namefile));
        dimensioni = size(img);
        disp('����� �������� ������ ���������� � ���� ������ ����������� ������������. ��� ����� ������� "�������� ���������� � ���� ������"');
        disp('��� �������� �������� �� �������. ��� ����� ������� "����������� ������������ �� �������"');
         delete('your.png');
    end
    %----------------
    if chos==2
        [namefile,pathname]=uigetfile('*','*');
        if namefile~=0
            [img,map]=imread(strcat(pathname,namefile));
            imshow(img);
            dimensioni = size(img);
        else
            warndlg('�� ������ ������� ����������.','��������!')
            pause(1);
               allHandle = allchild(0);
               allTag = get(allHandle, 'Tag');
               isWarndlg = strncmp(allTag, 'Msgbox_', 7);
               delete(allHandle(isWarndlg));
        end
        disp('�� ������� ����������. ������ �� ������ �� �������� � ���� ������. ��� ����� ������� "������� ����������")');
        disp('��� �������� �������� �� �������. ��� ����� ������� "����������� ������������ �� �������"');
    end
    %----------------
    if chos==3,
        clc;     
        if exist('img')
            RGB = imread('img');
            img = rgb2gray(RGB);
             if (exist('iris_database.dat')==2)
                load('iris_database.dat','-mat');
                face_number=face_number+1;
                data{face_number,1}=double(img);
                %sprintf('%s','hello',' ','ciao') 
                prompt={sprintf('%s',messaggio,'����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class))};
                title='����� ������������';
                lines=1;
                def={'1'};
                answer=inputdlg(prompt,title,lines,def);
                zparameter=double(str2num(char(answer)));
                if size(zparameter,1)~=0
                    class_number=zparameter(1);
                    if (class_number<=0)||(class_number>max_class)||(floor(class_number)~=class_number)||(~isa(class_number,'double'))||(any(any(imag(class_number))))
                        warndlg(sprintf('%s','����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class)),' Warning ')
                    else
                        disp('���������...����������, ���������');
                        if class_number==max_class;
                            % ��� ������� ������������ ��� �� ���� �������
                            % ���� ������
                            max_class = class_number+1;
                            features  = findfeatures(img,scales);
                        else
                            % ��� ������� ������������ ��� ���������� ����
                            % ������
                            features  = findfeatures(img,scales);
                        end


                        data{face_number,2} = class_number;
                        %                         L = length(features);
                        %                         for ii=1:L
                        %                             features_data{features_size+ii,1} = features{ii};
                        %                             features_data{features_size+ii,2} = class_number;
                        %                         end
                        %                         features_size = length(features_data);
                        features_data{features_size+1,1} = features;
                        features_data{features_size+1,2} = class_number;
                        features_data{features_size+1,3} = strcat(pathname,namefile);
                        features_size                    = size(features_data,1);
                        clc;
                        save('iris_database.dat','data','face_number','max_class','features_data','features_size','-append');
                        msgbox(sprintf('%s','����������� ���� ������� ��������� � ���� ������ ������������ ',num2str(class_number)),'Database result','help');
                        close all;
                        clear('img');
                        clc;
                        disp('����������� ���� ������� ��������� � ���� ������');
                        messaggio2 = sprintf('%s','Location: ',strcat(pathname,namefile));
                        disp(messaggio2);
                        messaggio2 = sprintf('%s','Iris ID: ',num2str(class_number));
                        disp(messaggio2);
                    end
                else
                    warndlg(sprintf('%s','����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class)),' Warning ')
                end
            else
                face_number=1;
                max_class=1;
                data{face_number,1}=double(img);
                prompt={sprintf('%s',messaggio,'����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class))};
                title='Class number';
                lines=1;
                def={'1'};
                answer=inputdlg(prompt,title,lines,def);
                zparameter=double(str2num(char(answer)));
                if size(zparameter,1)~=0
                    class_number=zparameter(1);
                    if (class_number<=0)||(class_number>max_class)||(floor(class_number)~=class_number)||(~isa(class_number,'double'))||(any(any(imag(class_number))))
                        warndlg(sprintf('%s','����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class)),' Warning ')
                    else
                        disp('���������...����������, ���������');
                        max_class=2;
                        data{face_number,2}=class_number;
                        features  = findfeatures(img,scales);
                        disp('Completed.');
                        features_data{1,1} = features;
                        features_data{1,2} = class_number;
                        features_data{1,3} = strcat(pathname,namefile);
                        features_size = size(features_data,1);
                        save('iris_database.dat','data','face_number','max_class','features_data','features_size');
                        msgbox(sprintf('%s','���� ������ ���� �����. ����������� ���� ������� ��������� � ���� ������ ������������ ',num2str(class_number)),'Database result','help');
                        clc;
                        close all;
                        clear('img');
                        disp('Iris image added to database.');
                        messaggio2 = sprintf('%s','Location: ',strcat(pathname,namefile));
                        disp(messaggio2);
                        messaggio2 = sprintf('%s','Iris ID: ',num2str(class_number));
                        disp(messaggio2);
                    end
                else
                    warndlg(sprintf('%s','����� ������������ ������ ���� ������������� ����������� ������, �� ����� ',num2str(max_class)),' Warning ')
                end
             end
%             if (exist('iris_database.dat')==2)
%                 load('iris_database.dat','-mat');
%                 face_number=face_number+1;
%                 data{face_number,1}=double(img);
%                 %sprintf('%s','hello',' ','ciao') 
%                 
% %                 title=num2str(max_class);
% %                 lines=1;
% %                 def={num2str(max_class)};
% %                 answer=inputdlg(prompt,title,lines,def);
% %                 zparameter=double(str2num(char(answer)));
% %                 class_number=zparameter(1);
% % 
% %                 
% %                 %���� ������ ID = 0 - ��������� ������ � ��������� ������ ������������� ����������� ����� � �������� ID
% %                 %���� ������ ���� �� ID (�� 1 �� class_number) - ��������� ������ ������
% %                     %���� ������ ������ - ���������� ��������� ������ � �������, ����������� � ����������� ID (class_number)
% %                     %���� ������ ������ ����������� - ��������� ��������� �� ������ � ������� ������ ������ ������
% %                 %���� ������ (max_class) - ����� ������ ������������������
% %                 %���� ������ �������������� ID, �������� �������� ������ max_class, �� ������������ ������������������ ��� ID (max_class)
% %                 if (class_number<=0)||(floor(class_number)~=class_number)||(~isa(class_number,'double'))||(any(any(imag(class_number))))
% %                     warndlg(sprintf('%s','ID ������������ ������ ���� ������������� ����������� ������ <= ',num2str(max_class)),'��������!')
% %                     elseIf
% %                         %if (class_number � �������� 1 - max_class)
% %                         (0<class)&&(class<=max_class)
% %                             if (inputed_pass==saved_pass)
% %                                 msgbox(sprintf('%s','��� ��, ������, ������ ',num2str(class_number)),'! ������ ���� � ���� ���� �������� :D','help');
% %                                 else
% %                                     msgbox(sprintf('%s','�����, ���� �� �� ������ ',num2str(class_number)),', ���� �� ������ � �������! �� � �������� ���� ����������� ��� �����! :D','help');
% %                             end
% %                 
% %                             elseIf (class_number==max_class)
% %                             %(���, ������, ���������! �����?)
% %                             disp('WTF?! :D')
% %                     else
% %                         if (class_number>max_class)
% %                             hoh=msgbox(sprintf('%s','�� ����� �� ������ ',num2str(class_number),'! �������� ����� ��� ����� �� ID �� 1 �� ',num2str(max_class)-1),'help');
% %                             set(hoh, 'Position', [800 300 400 75])
% %                         end
% %                 end
% 
%                     class_number=pass_id;
%                     disp('��������� ����������... ����������, ���������!');
%                         if (pass_id>0)
%                             features  = findfeatures(img,scales);
%                         end
% 
%                         data{face_number,2} = class_number;
%                         features_data{features_size+1,1} = features;
%                         features_data{features_size+1,2} = class_number;
%                         features_data{features_size+1,3} = strcat(pathname,namefile);
%                         features_size                    = size(features_data,1);
%                         clc;
%                         save('iris_database.dat','pass_id','data','face_number','max_class','features_data','features_size');
%                         msgbox(sprintf('%s','����������� ������� ��������� � ���� ������ ',num2str(class_number)),'����� ���� ������','help');
%                         close all;
%                         clear('img');
%                         clc;
%                         disp('���������� ������� ��������� � ���� ������.');
%                         messaggio2 = sprintf('%s','����: ',strcat(pathname,namefile));
%                         disp(messaggio2);
%                         messaggio2 = sprintf('%s','ID ������������: ',num2str(class_number));
%                         disp(messaggio2);
% %                         disp(data);
% %                         disp(face_number);
% %                         disp(max_class);
% %                         disp(features_data);
% %                         disp(features_size);
%                     end
%                 else
%                     warndlg(sprintf('%s','ID ������������ ������ ���� ������������� ����������� ������ <= ',num2str(max_class)),' ��������!')
                end
            end
    %----------------
    if chos==4,
        clc;
        close all;
        if exist('img')

            if (exist('iris_database.dat')==2)
                load('iris_database.dat','-mat');
                disp('��������� ����������... ����������, ���������!');
                % ��� �������������� ������������ �� �������� ��������.
                features  = findfeatures(img,scales);
                %                 L = length(features);
                %                 score = zeros(max_class-1,1);
                %                 for ii=1:L
                %                     pesi = zeros(features_size,1);
                %                     for jj=1:features_size
                %                         pesi(jj)=norm(features{ii}-features_data{jj,1});
                %                     end
                %                     [val,pos]=min(pesi);
                %                     trovato = features_data{pos,2};
                %                     score(trovato)=score(trovato)+1;
                %                 end
                %                 [val,pos]=max(score);
                messaggio2 = sprintf('%s','��������� ����������: ',strcat(pathname,namefile));
                disp(messaggio2);
                disp('---');
                pesi = zeros(features_size,1);
                for ii=1:features_size
                    messaggio2 = sprintf('%s','������������ ����������:',features_data{ii,3},' �����: ',num2str(features_data{ii,2}));
%                     disp(messaggio2);
                    % hd = gethammingdistance(template1, mask1, template2,mask2, scales)
                    template1 = features{1};
                    mask1     = features{2};
                    template2 = features_data{ii,1}{1};
                    mask2     = features_data{ii,1}{2};
                    pesi(ii)  = gethammingdistance(template1, mask1, template2,mask2, scales);
                end
                [val,pos] = min(pesi);
                pos       = features_data{pos,2};
                disp('---');
                if pesi > 0.4
                    disp('���������� � ���� ������ �� �������!');
                else
                    messaggio2 = sprintf('%s','������������ ����������� �������: ',features_data{pos,3});
                    disp(messaggio2);
                    disp('����� ������� �����������');
                    disp(pos);
%                      disp(pesi);
                end
            else
                warndlg('��������� ����������. ���� ������ �����.',' ��������!')
            end
        else
            warndlg('��������� ������� �����������.',' ��������!')
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         delete('your-normal.jpg');
    end
    %----------------
    if chos==5,
        clc;
        close all;
        clear('img');
        if (exist('iris_database.dat')==2)
            load('iris_database.dat','-mat');
            msgbox(sprintf('%s','� ���� ������ ',num2str(face_number),' ����������. ��� ������� ���������� (',num2str((max_class)-1),') ID. �������� ����������� ������ ���� ������ �������.'),'��������� ���� ������','help');
            disp('����������� ������� ������� ��������� � ���� ������:');
            disp('---');
            for ii=1:features_size
                messaggio2 = sprintf('%s','����:',features_data{ii,3});%,' ID: ',num2str(features_data{ii,2}));
                disp(messaggio2);
                messaggio2 = sprintf('%s','ID ������������: ',num2str(features_data{ii,2}));
                disp(messaggio2);
                disp('---');
            end
        else
            msgbox('���� ������ �����.','��������� ���� ������','help');
        end
    end
    %----------------
    if chos==6,
        clc;
        close all;
        if (exist('iris_database.dat')==2)
            button = questdlg('�� ����� ������ ������� ���� ������?');
            if strcmp(button,'Yes')
                delete('iris_database.dat');
                clear('data','face_number','max_class','features_data','features_size');
                msgbox('���� ������ ���� ������� �������.','Database removed','help');
            end
        else
            warndlg('���� ������ �����.',' ��������!')
        end
    end
    if chos==7
        close;       
    end
end


    end
if chos==2,
        load('iris_database.dat','-mat');
%        warndlg(sprintf('%s','��������� ������ ID ������������: ',num2str(max_class)))
        clc;
%         warndlg('�� � �������!','�������')
        Momo={'������� id','������� ������','��������� ������'};
        name='Registration';
        numlines=1;
        defaultanswer={'','',''};
        answer=inputdlg(Momo,name,numlines,defaultanswer);
        
        %Momo = inputdlg('������� ������','��������� ������')
            pass_id = answer{1};
            pass = (str2num(answer{2}));
            pass_rep = (str2num(answer{3}));
                if pass==pass_rep

                    userdb=[pass_id,'.dat'];
                   if (exist(userdb)==0)
                        f = fopen(userdb, 'w'); fclose(f);
                        save(userdb,'pass_id','pass','-mat');
                   end
                    warndlg(sprintf('����������! �� ����������������!'))
                    choss=1;
                else
                    warndlg(sprintf('��������, ������ ��������!'))
                end
       	pause(1)
        allHandle = allchild(0);
        allTag = get(allHandle, 'Tag');
        isWarndlg = strncmp(allTag, 'Msgbox_', 7);
        delete(allHandle(isWarndlg));
                
end
%-------------------
if chos==3,
        clc;
        warndlg('����!','�������')
        pause(1)
        allHandle = allchild(0);
        allTag = get(allHandle, 'Tag');
        isWarndlg = strncmp(allTag, 'Msgbox_', 7);
        delete(allHandle(isWarndlg));
        pause(1)
        break;
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function h = addcircle(h, c, radius, weight)

[hr, hc] = size(h);

if nargin == 3
    weight = 1;
end

% c � radius ������ ���� ������������ � int ���������.
if any(c-fix(c))
    error('����� ���������� ������ ���� ����� ������');
end

if radius-fix(radius)
    error('������ ������ ���� ����� ������');
end

x = 0:fix(radius/sqrt(2));
costheta = sqrt(1 - (x.^2 / radius^2));
y = round(radius*costheta);

% ������ ���������� 8 �����, �������������� ���� �� ����� �� ����� �
% ����������� �� ���������� [px py].

px = c(2) + [x  y  y  x -x -y -y -x];
py = c(1) + [y  x -x -y -y -x  x  y];

% ���������� �����, ����������� �� ��������� �������.
validx = px>=1 & px<=hr;
validy = py>=1 & py<=hc;
valid = find(validx & validy);

px = px(valid);
py = py(valid);

ind = px+(py-1)*hr;
h(ind) = h(ind) + weight;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function newim = adjgamma(im, g)

if g <= 0
    error('�������� ����� ������ ���� > 0');
end

if isa(im,'uint8');
    newim = double(im);
else
    newim = im;
end

% ��������������� ��������� 0-1.
newim = newim-min(min(newim));
newim = newim./max(max(newim));

newim =  newim.^(1/g);   % ���������� �����-�������.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [gradient, or] = canny(im, sigma, scaling, vert, horz)

xscaling = vert;
yscaling = horz;

hsize = [6*sigma+1, 6*sigma+1];   % ������ �������.

gaussian = fspecial('gaussian',hsize,sigma);
im = filter2(gaussian,im);        % ����������� ����������.

im = imresize(im, scaling);

[rows, cols] = size(im);

h =  [  im(:,2:cols)  zeros(rows,1) ] - [  zeros(rows,1)  im(:,1:cols-1)  ];
v =  [  im(2:rows,:); zeros(1,cols) ] - [  zeros(1,cols); im(1:rows-1,:)  ];
d1 = [  im(2:rows,2:cols) zeros(rows-1,1); zeros(1,cols) ] - ...
    [ zeros(1,cols); zeros(rows-1,1) im(1:rows-1,1:cols-1)  ];
d2 = [  zeros(1,cols); im(1:rows-1,2:cols) zeros(rows-1,1);  ] - ...
    [ zeros(rows-1,1) im(2:rows,1:cols-1); zeros(1,cols)   ];

X = ( h + (d1 + d2)/2.0 ) * xscaling;
Y = ( v + (d1 - d2)/2.0 ) * yscaling;

gradient = sqrt(X.*X + Y.*Y); % �������� ���������.

or = atan2(-Y, X);            % ���� �� -pi �� + pi.
neg = or<0;                   % ����� ����� 0-pi.
or = or.*~neg + (or+pi).*neg;
or = or*180/pi;               % ������� � �������.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [x,y] = circlecoords(c, r, imgsize,nsides)


if nargin == 3
    nsides = 600;
end

nsides = round(nsides);

a = [0:pi/nsides:2*pi];
xd = (double(r)*cos(a)+ double(c(1)) );
yd = (double(r)*sin(a)+ double(c(2)) );

xd = round(xd);
yd = round(yd);

%������������� �� -ves.
%������������� �� ��������, ������ �����������.
xd2 = xd;
coords = find(xd>imgsize(2));
xd2(coords) = imgsize(2);
coords = find(xd<=0);
xd2(coords) = 1;

yd2 = yd;
coords = find(yd>imgsize(1));
yd2(coords) = imgsize(1);
coords = find(yd<=0);
yd2(coords) = 1;

x = int32(xd2);
y = int32(yd2);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [template, mask] = encode(polar_array,noise_array, nscales, minWaveLength, mult, sigmaOnf)

%������� ��������������� ������� � �������� ������.
[E0 filtersum] = gaborconvolve(polar_array, nscales, minWaveLength, mult, sigmaOnf);

length = size(polar_array,2)*2*nscales;

template = zeros(size(polar_array,1), length);

length2 = size(polar_array,2);
h = 1:size(polar_array,1);

%�������� ������� �������.

mask = zeros(size(template));

for k=1:nscales

    E1 = E0{k};

    %���� �����������.
    H1 = real(E1) > 0;
    H2 = imag(E1) > 0;

    % ���� ��������� ������ � 0, �� ������� ������ ����������, ������� ���������.
%     in the noise mask
    H3 = abs(E1) < 0.0001;


    for i=0:(length2-1)

        ja = double(2*nscales*(i));
        %�������� ��������������� �������.
        template(h,ja+(2*k)-1) = H1(h, i+1);
        template(h,ja+(2*k)) = H2(h,i+1);

        %�������� ����� �����.
        mask(h,ja+(2*k)-1) = noise_array(h, i+1) | H3(h, i+1);
        mask(h,ja+(2*k)) =   noise_array(h, i+1) | H3(h, i+1);

    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [row, col, r] = findcircle(image,lradius,uradius,scaling, sigma, hithres, lowthres, vert, horz)

lradsc = round(lradius*scaling);
uradsc = round(uradius*scaling);
rd = round(uradius*scaling - lradius*scaling);

% ��������� ���� �����������.
[I2 or] = canny(image, sigma, scaling, vert, horz);
I3 = adjgamma(I2, 1.9);
I4 = nonmaxsup(I3, or, 1.5);
edgeimage = hysthresh(I4, hithres, lowthres);

% ���������� ��������� �������������� ����.
h = houghcircle(edgeimage, lradsc, uradsc);

maxtotal = 0;

%���������� ��������� � ������������ ���� �, �������������, ��������� �����.
for i=1:rd

    layer = h(:,:,i);
    [maxlayer] = max(max(layer));


    if maxlayer > maxtotal

        maxtotal = maxlayer;


        r = int32((lradsc+i) / scaling);

        [row,col] = ( find(layer == maxlayer) );


        row = int32(row(1) / scaling); %���������� ������ ������ ������������ ��������.
        col = int32(col(1) / scaling);

    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function lines = findline(image)

[I2 or] = canny(image, 2, 1, 0.00, 1.00);

I3 = adjgamma(I2, 1.9);
I4 = nonmaxsup(I3, or, 1.5);
edgeimage = hysthresh(I4, 0.20, 0.15);


theta = (0:179)';
[R, xp] = radon(edgeimage, theta);

maxv = max(max(R));

if maxv > 25
    i = find(R == max(max(R)));
else
    lines = [];
    return;
end

[foo, ind] = sort(-R(i));
u = size(i,1);
k = i(ind(1:u));
[y,x]=ind2sub(size(R),k);
t = -theta(x)*pi/180;
r = xp(y);

lines = [cos(t) sin(t) -r];

cx = size(image,2)/2-1;
cy = size(image,1)/2-1;
lines(:,3) = lines(:,3) - lines(:,1)*cx - lines(:,2)*cy;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [EO, filtersum] = gaborconvolve(im, nscale, minWaveLength, mult, ...
    sigmaOnf)

[rows cols] = size(im);
filtersum = zeros(1,size(im,2));

EO = cell(1, nscale);          %��������������� ��������� ������� �����.

ndata = cols;
if mod(ndata,2) == 1             %������������ ��������� �����, ���� �� �������� ����������.
    ndata = ndata-1;
end

logGabor  = zeros(1,ndata);
result = zeros(rows,ndata);

radius =  [0:fix(ndata/2)]/fix(ndata/2)/2;  % ������� �������� 0 - 0.5.
radius(1) = 1;

wavelength = minWaveLength;        %���������� ����� ����� �������.


for s = 1:nscale,                  %��� ������� ��������.

    %���������� - ������� ���������� ���������� ������������ �������.
    fo = 1.0/wavelength;
    rfo = fo/0.5;
    %��������������� �������.
    logGabor(1:ndata/2+1) = exp((-(log(radius/fo)).^2) / (2 * log(sigmaOnf)^2));
    logGabor(1) = 0;

    filter = logGabor;

    filtersum = filtersum+filter;

    %��� ������ ������ �������� ����������� �������� ������� ��������� ��������������.
    for r = 1:rows	%��� ������ ������

        signal = im(r,1:ndata);


        imagefft = fft( signal );


        result(r,:) = ifft(imagefft .* filter);

    end

    %���������� �������� ������ ��� ������� ��������.
    EO{s} = result;

    wavelength = wavelength * mult;       %���������� ����� ����� ���������� �������.
end                                     %��������� ���������� ��������.

filtersum = fftshift(filtersum);

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function h = houghcircle(edgeim, rmin, rmax)
 [rows,cols] = size(edgeim);
 nradii = rmax-rmin+1;
 h = zeros(rows,cols,nradii);
 
 
 [y,x] = find(edgeim~=0);
 
 hr     = rows;
 hc     = cols;
 hrhc   = hr*hc;
 weight = 1;
 
 %��� ������ ����� ���� �������������� ���������� � ������� ��������� radii
 for index=1:size(y)
 
     cx = x(index);
     cy = y(index);
     
     c  = [cx,cy];
 
     for n=1:nradii
 
         
         radius   = n+rmin;
         xd       = 0:fix(radius/sqrt(2));
         costheta = sqrt(1-(xd.^2/radius^2));
         yd       = round(radius*costheta);
         px       = c(2) + [xd  yd  yd  xd -xd -yd -yd -xd];
         py       = c(1) + [yd  xd -xd -yd -yd -xd  xd  yd];
         validx   = px>=1 & px<=hr;
         validy   = py>=1 & py<=hc;
         valid    = find(validx & validy);
         px       = px(valid);
         py       = py(valid);
         ind      = px+(py-1)*hr;
         
         positions    = ind+(n-1)*hrhc;
         h(positions) = h(positions)+ weight;
         % h(ind+(n-1)*hr*hc) = h(ind+(n-1)*hr*hc)+ weight;
     end
 
 end

function bw = hysthresh(im, T1, T2)

if (T2 > T1 | T2 < 0 | T1 < 0)  %�������� ���������������� �������
    error('T1 ������ ���� >= T2 � ��� ��� ������ ���� >= 0 ');
end

[rows, cols] = size(im);    %��������������� ���������� ��������� �������� ��� �������� � ��������.
rc = rows*cols;
rcmr = rc - rows;
rp1 = rows+1;

bw = im(:);                 %��������� ����������� � ������-�������.
pix = find(bw > T1);        %����� ������� ���� ���������� ��������� > T1
npix = size(pix,1);         %���������� �������� �� ��������� > T1

stack = zeros(rows*cols,1); %�������� ������� �����, ������� ������� �� ������������.

stack(1:npix) = pix;        %��������� ��� ����� ����� � ������.
stp = npix;                 %���������� ��������� �����.
for k = 1:npix
    bw(pix(k)) = -1;        %�������� �����, ��� ����.
end


% ��������������� ���������� �������, O, ������� �������� ��������, ��������������� 8 �������� ������ ����� �����.

O = [-1, 1, -rows-1, -rows, -rows+1, rows-1, rows, rows+1];

while stp ~= 0            %���� ���� �� �����
    v = stack(stp);         %������� � ���������� ��������.
    stp = stp - 1;

    if v > rp1 && v < rcmr   %������ �� �������� ������������������� ��������
        %��������� �� ���������� �������
        %������ �� ��� ������� � ����
        %��� ���������� ���������.
        index = O+v;	    %���������� �������� ����� ������ �������.
        for l = 1:8
            ind = index(l);
            if bw(ind) > T2   %���� �������� > T2,
                stp = stp+1;  %�������� ������ ������ � ����.
                stack(stp) = ind;
                bw(ind) = -1; %��������, ��� �����, ������������� �� ����.
            end
        end
    end
end



bw = (bw == -1);            %�������� ����, ��� �� �������� �����
bw = reshape(bw,rows,cols); %� �������� ����������.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [x,y] = linecoords(lines, imsize)

xd = [1:imsize(2)];
yd = (-lines(3) - lines(1)*xd ) / lines(2);

coords = find(yd>imsize(1));
yd(coords) = imsize(1);
coords = find(yd<1);
yd(coords) = 1;

x = int32(xd);
y = int32(yd);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function im = nonmaxsup(inimage, orient, radius)

if size(inimage) ~= size(orient)
    error('������������ ��������� � ��������������� ������ ��������');
end

if radius < 1
    error('������ ������ ���� >= 1');
end

[rows,cols] = size(inimage);
im = zeros(rows,cols);        %�������� ������ ��� ��������� ������ �����������
iradius = ceil(radius);

%��������������� ���������� �������� �� x � y ��� ������� ���� ����������.

angle = [0:180].*pi/180;    %������ ����� � ����� � 1 ������ (�� ����� ������������ �������� � ��������)
xoff = radius*cos(angle);   %�������� �� x � y ����� ����������� ������� � ����
yoff = radius*sin(angle);   %��� ������ ��������������� �������.

hfrac = xoff - floor(xoff); %������� �������� �� x - ������������� ���������
vfrac = yoff - floor(yoff); %������� �������� �� y - ������������� ���������

orient = fix(orient)+1;     %���������� ���������� � 0 ��������,
%�� ������� ���������� � ������� 1.

%������ �������� �� ���� ���������� �� ����������������� ���������
%������ � ������ ����� ������ ������� ������� 
%��� ����������� ��������������� ����������.

for row = (iradius+1):(rows - iradius)
    for col = (iradius+1):(cols - iradius)

        or = orient(row,col);   %��������� �� �������������� ����������� ������

        x = col + xoff(or);     %����������� �������� x, y ��� ������ �����
        y = row - yoff(or);

        fx = floor(x);          %�������� ����� �������� �������� ������ ������ ����� x, y
        cx = ceil(x);
        fy = floor(y);
        cy = ceil(y);
        tl = inimage(fy,fx);    %��������� �������� ������ ������� � ����� ���������.
        tr = inimage(fy,cx);    %�������� �������
        bl = inimage(cy,fx);    %������� ������
        br = inimage(cy,cx);    %������� �������

        upperavg = tl + hfrac(or) * (tr - tl);  %���������� ���������� ������������
        loweravg = bl + hfrac(or) * (br - bl);  %��� ��������� �������� ��� ����� x, y
        v1 = upperavg + vfrac(or) * (loweravg - upperavg);

        if inimage(row, col) > v1 %�������� �������� � ��������������� �������...

            x = col - xoff(or);     %����������� �������� x, y ��� ������ �����
            y = row + yoff(or);

            fx = floor(x);
            cx = ceil(x);
            fy = floor(y);
            cy = ceil(y);
            tl = inimage(fy,fx);    %��������� �������� ������ ������� � ����� ���������.
            tr = inimage(fy,cx);    %�������� �������
            bl = inimage(cy,fx);    %������� ������
            br = inimage(cy,cx);    %������� �������

            upperavg = tl + hfrac(or) * (tr - tl);
            loweravg = bl + hfrac(or) * (br - bl);
            v2 = upperavg + vfrac(or) * (loweravg - upperavg);

            if inimage(row,col) > v2            %�������� �� ��������� ��������.
                im(row, col) = inimage(row, col); %������ �������� � �������� �����������.
            end

        end
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [polar_array, polar_noise] = normaliseiris(image, x_iris, y_iris, r_iris,...
    x_pupil, y_pupil, r_pupil, radpixels, angulardiv)

radiuspixels = radpixels + 2;
angledivisions = angulardiv-1;

r = 0:(radiuspixels-1);

theta = 0:2*pi/angledivisions:2*pi;

x_iris = double(x_iris);
y_iris = double(y_iris);
r_iris = double(r_iris);

x_pupil = double(x_pupil);
y_pupil = double(y_pupil);
r_pupil = double(r_pupil);

%���������� �������� ������ ������ ������������ ������ �������� �������� �����.
ox = x_pupil - x_iris;
oy = y_pupil - y_iris;

if ox <= 0
    sgn = -1;
elseif ox > 0
    sgn = 1;
end

if ox==0 && oy > 0

    sgn = 1;

end

r = double(r);
theta = double(theta);

a = ones(1,angledivisions+1)* (ox^2 + oy^2);

%ox = 0
if ox == 0
    phi = pi/2;
else
    phi = atan(oy/ox);
end

b = sgn.*cos(pi - phi - theta);

%���������� ������� ������� ����� � ����������� �� ����.
r = (sqrt(a).*b) + ( sqrt( a.*(b.^2) - (a - (r_iris^2))));

r = r - r_pupil;

rmat = ones(1,radiuspixels)'*r;

rmat = rmat.* (ones(angledivisions+1,1)*[0:1/(radiuspixels-1):1])';
rmat = rmat + r_pupil;


%���������� ��������� �������� ������/������� � �������/������
%��� ��� ��� ����� �� ��������� � ������� ��������� � ������ ���.
%�� ���� �� ��������� ������ ��� �������, ��� ������ �������� ��������.
rmat  = rmat(2:(radiuspixels-1), :);

%��������� � ���������� ����������� ������������ ���� ������� ������ ������� �������
% region
xcosmat = ones(radiuspixels-2,1)*cos(theta);
xsinmat = ones(radiuspixels-2,1)*sin(theta);

xo = rmat.*xcosmat;
yo = rmat.*xsinmat;

xo = x_pupil+xo;
yo = y_pupil-yo;

%������� �������� ������������� ��� ���������������� ��������� ����������� �������������.
[x,y] = meshgrid(1:size(image,2),1:size(image,1));
polar_array = interp2(x,y,image,xo,yo);

%�������� ������� ����� � ����������� NaN � polar_array
polar_noise = zeros(size(polar_array));
coords = find(isnan(polar_array));
polar_noise(coords) = 1;

polar_array = double(polar_array)./255;


%������������ �����������, ���������� �� ����������� ����� ������.

%���������� �� ������� �����, ������� ����� ��� ����������� �������� �������
coords = find(xo > size(image,2));
xo(coords) = size(image,2);
coords = find(xo < 1);
xo(coords) = 1;

coords = find(yo > size(image,1));
yo(coords) = size(image,1);
coords = find(yo<1);
yo(coords) = 1;

xo = round(xo);
yo = round(yo);

xo = int32(xo);
yo = int32(yo);

ind1 = sub2ind(size(image),double(yo),double(xo));

image = uint8(image);

image(ind1) = 255;
%���������� ��������� ���������� ������ �������.
[x,y] = circlecoords([x_iris,y_iris],r_iris,size(image));
ind2 = sub2ind(size(image),double(y),double(x));
%���������� ��������� ���������� ������.
[xp,yp] = circlecoords([x_pupil,y_pupil],r_pupil,size(image));
ind1 = sub2ind(size(image),double(yp),double(xp));

image(ind2) = 255;
image(ind1) = 255;

imwrite(image,'your-normal.jpg','jpg');

%������ �������� NaN ����� ����������� ����������� �������
coords = find(isnan(polar_array));
polar_array2 = polar_array;
polar_array2(coords) = 0.5;
avg = sum(sum(polar_array2)) / (size(polar_array,1)*size(polar_array,2));
polar_array(coords) = avg;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [circleiris, circlepupil, imagewithnoise] = segmentiris(eyeimage)

%����������� ���������� �������� ������ � �������

%CUHK
lpupilradius = 28;
upupilradius = 75;
lirisradius = 80;
uirisradius = 150;

%    %LIONS
%    lpupilradius = 32;
%    upupilradius = 85;
%    lirisradius = 145;
%    uirisradius = 169;


%����������� ������������ ��������������� ��� ��������� �������� �������������� ����
scaling = 0.4;

reflecthres = 240;

%���������� ������ �������� ��������
[row, col, r] = findcircle(eyeimage, lirisradius, uirisradius, scaling, 2, 0.20, 0.19, 1.00, 0.00);

circleiris = [row col r];

rowd = double(row);
cold = double(col);
rd = double(r);

irl = round(rowd-rd);
iru = round(rowd+rd);
icl = round(cold-rd);
icu = round(cold+rd);

imgsize = size(eyeimage);

if irl < 1
    irl = 1;
end

if icl < 1
    icl = 1;
end

if iru > imgsize(1)
    iru = imgsize(1);
end

if icu > imgsize(2)
    icu = imgsize(2);
end

%���������� ���������� ������� ������, ��������� ���� ����� ���������
%�������
% detected iris boundary
imagepupil = eyeimage( irl:iru,icl:icu);

%���������� ������� ������
[rowp, colp, r] = findcircle(imagepupil, lpupilradius, upupilradius ,0.6,2,0.25,0.25,1.00,1.00);

rowp = double(rowp);
colp = double(colp);
r = double(r);

row = double(irl) + rowp;
col = double(icl) + colp;

row = round(row);
col = round(col);

circlepupil = [row col r];

%��������� ������ ��� ������ �������� �����
%������� ����� ����� ����� �������� NaN
imagewithnoise = double(eyeimage);

%���������� �������� ����
topeyelid = imagepupil(1:(rowp-r),:);
lines = findline(topeyelid);

if size(lines,1) > 0
    [xl yl] = linecoords(lines, size(topeyelid));
    yl = double(yl) + irl-1;
    xl = double(xl) + icl-1;

    yla = max(yl);

    y2 = 1:yla;

    ind3 = sub2ind(size(eyeimage),yl,xl);
    imagewithnoise(ind3) = NaN;

    imagewithnoise(y2, xl) = NaN;
end

%���������� ������� ����
bottomeyelid = imagepupil((rowp+r):size(imagepupil,1),:);
lines = findline(bottomeyelid);

if size(lines,1) > 0

    [xl yl] = linecoords(lines, size(bottomeyelid));
    yl = double(yl)+ irl+rowp+r-2;
    xl = double(xl) + icl-1;

    yla = min(yl);

    y2 = yla:size(eyeimage,1);

    ind4 = sub2ind(size(eyeimage),yl,xl);
    imagewithnoise(ind4) = NaN;
    imagewithnoise(y2, xl) = NaN;

end

%��� ���� ������ CUHK ������ ������� �� ������
ref = eyeimage < 100;
coords = find(ref==1);
imagewithnoise(coords) = NaN;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function templatenew = shiftbits(template, noshifts,nscales)

templatenew = zeros(size(template));

width = size(template,2);
s = round(2*nscales*abs(noshifts));
p = round(width-s);

if noshifts == 0
    templatenew = template;

    %���� �������� noshifts �������������, �������� �����.
elseif noshifts < 0

    x=1:p;

    templatenew(:,x) = template(:,s+x);

    x=(p + 1):width;

    templatenew(:,x) = template(:,x-p);

else

    x=(s+1):width;

    templatenew(:,x) = template(:,x-s);

    x=1:s;

    templatenew(:,x) = template(:,p+x);

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [out]=findfeatures(eyeimage,scales)
radial_res  = 20;
angular_res = 240;

%��������� ������ IRIS ���� �������� 9600 ���

%��������� ����������� �������
nscales=scales;
minWaveLength=18;
mult=1; % �� ��������� ��� nscales = 1
sigmaOnf=0.5;

[circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);


imagewithnoise2 = uint8(imagewithnoise);
imagewithcircles = uint8(eyeimage);

%���������� ��������� �������� ������ �������� ��������
[x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
ind2 = sub2ind(size(eyeimage),double(y),double(x));

%���������� ��������� �������� ���������� ������
[xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
ind1 = sub2ind(size(eyeimage),double(yp),double(xp));


imagewithnoise2(ind2) = 255;
imagewithnoise2(ind1) = 255;
%��������� �� ����������� ������
imagewithcircles(ind2) = 255;
imagewithcircles(ind1) = 255;

[polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3), radial_res, angular_res);


[template mask] = encode(polar_array, noise_array, nscales, minWaveLength, mult, sigmaOnf);
out{1} = template;
out{2} = mask;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function hd = gethammingdistance(template1, mask1, template2, mask2, scales)

template1 = logical(template1);
mask1 = logical(mask1);

template2 = logical(template2);
mask2 = logical(mask2);

hd = NaN;

%����� ����� � ������, ��������� ����������� ���������� ��������
for shifts=-8:8

    template1s = shiftbits(template1, shifts,scales);
    mask1s = shiftbits(mask1, shifts,scales);


    mask = mask1s | mask2;

    nummaskbits = sum(sum(mask == 1));

    totalbits = (size(template1s,1)*size(template1s,2)) - nummaskbits;

    C = xor(template1s,template2);

    C = C & ~mask;
    bitsdiff = sum(sum(C==1));

    if totalbits == 0

        hd = NaN;

    else

        hd1 = bitsdiff / totalbits;


        if  hd1 < hd || isnan(hd)

            hd = hd1;

        end


    end

end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


