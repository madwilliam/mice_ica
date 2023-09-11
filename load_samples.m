function sample_data = load_samples(mice_id)
    time_points = [15,22,28,35,60];
    [oi,seedcenter] = load_basics();
    sample_data = zeros(26,5,2500);
    id=1;
    for time = time_points
        fc = 1;
        file = dir(['/N/slate/zw72/allfiles/Mouse' num2str(mice_id) '-*-P' num2str(time) '-fc' num2str(fc) '.mat']);
        if length(file)>0
            file_name = [file.folder,'/',file.name];
            load(file_name,'all_contrasts2') % load data to run FC on
            for  seed_id = 1:26
                seed = floor(seedcenter(seed_id,:));
                sample_data(seed_id,id,:) = all_contrasts2(seed(1),seed(2),1,:);
            end
        end
        id = id+1;
    end
end