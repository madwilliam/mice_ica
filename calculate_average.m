function calculate_average(mice_id)
    time_points = [15,22,28,35,60];
    all_average_data = zeros(5,78,78,2500);
    id = 1;
    for time = time_points
        average_data = zeros(78,78,2500);
        counter =1;
        for fc = 1:6
            file = dir(['/N/slate/zw72/allfiles/Mouse' num2str(mice_id) '-*-P' num2str(time) '-fc' num2str(fc) '.mat']);
            if ~isempty(file)
                file_name = [file.folder,'/',file.name];
                try
                    load(file_name,'all_contrasts2') 
                    average_data = average_data + squeeze(all_contrasts2(:,:,1,:));
                    counter = counter +1;
                catch
                    disp(fc)
                end
            end
        end
        all_average_data(id,:,:,:) = average_data/counter;
        id = id+1;
        isbrain = load(file_name,'isbrain2').isbrain2;
        file_name = fullfile('/N/slate/zw72/average_per_mice_new/',['Mouse' num2str(mice_id) '.mat']);
        save(file_name,'all_average_data','isbrain')
    end
end