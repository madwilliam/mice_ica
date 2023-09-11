function plot_fc_per_mice(mice)
    [oi,seedcenter] = load_basics();
    n_rows = 5;
    time_periods = {'15','22','28','35','60'};
    plot_id = 1;
    mat = load(['/N/slate/zw72/average_per_mice_fc/Mouse' num2str(mice) '.mat']);
    for seed = 1:26
        for time = 1:5
            if mod(seed,n_rows)==1&&time==1
                if seed~=1
                    saveas(gcf,['~/Desktop/Display/Mouse_' num2str(mice) '_plot_' num2str(plot_id) '.png'])
                    close all
                    plot_id = plot_id+1;
                end
                f = figure('visible','off');
                ha=tight_subplot(n_rows,5,[0.03 0.03],[0.1 0.1],[0.1 0.1]);
                fhandle=gcf;
                set(gcf,'position',[1000,1000,1000,1000])
                sgtitle(['Mouse ' num2str(mice)])
            end
            axis_id = mod((seed-1),n_rows)*n_rows+time;
            axis = ha(axis_id);
            hold(axis,'on')
            axes(axis)
            imagesc(mat.R_Data(:,:,seed,time))
            scatter(seedcenter(seed,1),seedcenter(seed,2),100,'r.')
            title(['P ' time_periods{time} ' seed ' num2str(seed)])
            hold(axis,'off')
        end
    end
    saveas(gcf,['~/Desktop/Display/Mouse_' num2str(mice) '_plot_' num2str(plot_id) '.png'])
    close all
end