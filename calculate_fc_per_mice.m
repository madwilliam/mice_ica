function calculate_fc_per_mice(mousei)
    [oi,seedcenter] = load_basics();
    R_Data = zeros(78,78,26,5);
    Rs_Data = zeros(26,26,5);
    mat = load(['/N/slate/zw72/average_per_mice_new/Mouse' num2str(mousei) '.mat']);
    all_data = mat.all_average_data;
    mm=10;
    mpp=mm/oi.nVx;
    seedradmm=0.25;
    seedradpix=seedradmm/mpp;
    % make image P with numbered seeds in clusters
    [P,xp]=burnseeds(seedcenter,seedradpix,mat.isbrain);
    P=fliplr(P);
    for i = 1:5
        strace=P2strace(P,squeeze(all_data(i,:,:,:)),xp); 
        R_Data(:,:,:,i)=strace2R(strace,squeeze(all_data(i,:,:,:)),xp); 
        Rs_Data(:,:,i)=normr(strace)*normr(strace)';
    end
    save(['/N/slate/zw72/average_per_mice_fc/Mouse' num2str(mousei) '.mat'],'R_Data','Rs_Data')
end