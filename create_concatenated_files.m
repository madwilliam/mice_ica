for mice = 5
    disp(mice)
    time_periods = IO.get_time_periods();
    for time = time_periods
        disp([num2str(mice) time])
        all_recordings = [];
        time = str2num(time{1});
        for recording = 1:5
            try
                mat = IO.load_mice(mice,time,recording);
                all_recordings = cat(4,all_recordings,mat.all_contrasts2);
            catch
                ...
            end
        end
        isbrain = mat.isbrain2;
        save(['/N/slate/zw72/concated_per_mice/Mouse_' num2str(mice) '_P' num2str(time) '.mat'],'all_recordings','isbrain','-v7.3')
    end
end