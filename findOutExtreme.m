function[maxR,minR,maxC,minC]=findOutExtreme(Buff)

[R,C]=size(Buff);

for m=1:R
%     for n=1:C
        RBuff=Buff(m,:);
        
        [AlongCMin]=find(RBuff>0);
            [AlongCMax]=find(RBuff>0);
        
        if numel(AlongCMin)==0
            AlongCMin=9999;
        end
        
         if numel(AlongCMax)==0
            AlongCMax=-9999;
         end
       
        MaxC(m)=max(AlongCMax);
        MinC(m)=min(AlongCMin);        
%     end
end
[maxC]=max(MaxC(:))
[minC]=min(MinC(:))


% for m=1:C
for n=1:C
        RBuff=Buff(:,n);
        
        [AlongCMin]=find(RBuff>0);
            [AlongCMax]=find(RBuff>0);
        
        if numel(AlongCMin)==0
            AlongCMin=9999;
        end
        
         if numel(AlongCMax)==0
            AlongCMax=-9999;
         end
        MaxR(n)=max(AlongCMax);
        MinR(n)=min(AlongCMin);        
       
%     end
end

[maxR]=max(MaxR(:))
[minR]=min(MinR(:))